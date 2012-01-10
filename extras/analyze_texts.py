#!/usr/bin/python
#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-06
#analyze texts, how many commands are unknown?
import extract_maps
try:
    from pretty_map_headers import map_name_cleaner
except Exception, exc: pass
from operator import itemgetter
import sys
debug = False #set to True to increase logging output

#how many times is each command byte called?
totals = {}
total_text_commands = 0
should_be_total = 0

def get_text_pointer(texts_pointer, text_id):
    if type(texts_pointer) == str: texts_pointer = int(texts_pointer, 16)
    if type(text_id) == str: text_id = int(text_id)

    byte1 = ord(extract_maps.rom[texts_pointer + ((text_id - 1) * 2)])
    byte2 = ord(extract_maps.rom[texts_pointer + ((text_id - 1) * 2) + 1])
    pointer = (byte1 + (byte2 << 8))

    return pointer

def how_many_until(byte, starting):
    index = extract_maps.rom.find(byte, starting)
    return index-starting

def print_command_debug_info(command_byte, text_id, text_pointer, map_id):
    if debug:
        print "byte is " + str(command_byte) + " on text #" + str(text_id) + " at " + hex(text_pointer) + " on map " + str(map_id) + " (" + extract_maps.map_headers[map_id]["name"] + ")"

def add_command_byte_to_totals(byte):
    global totals
    if not byte in totals.keys(): totals[byte] = 1
    else: totals[byte] += 1

def process_00_subcommands(start_address, end_address):
    """split this text up into multiple lines
    based on subcommands ending each line"""
    lines = {}
    subsection = extract_maps.rom[start_address:end_address+1]

    line_count = 0
    current_line = []
    for pbyte in subsection:
        byte = ord(pbyte)
        current_line.append(byte)
        if  byte == 0x4f or byte == 0x51 or byte == 0x55:
            lines[line_count] = current_line
            current_line = []
            line_count += 1

    #don't forget the last line
    lines[line_count] = current_line
    line_count += 1
    return lines

def parse_text_script(text_pointer, text_id, map_id, txfar=False):
    global total_text_commands
    offset = text_pointer
    commands = {}
    command_counter = 0
    
    end = False
    while not end:
        command = {}
        command_byte = ord(extract_maps.rom[offset])
        
        print_command_debug_info(command_byte, text_id, text_pointer, map_id)
        if  command_byte == 0:
            #read until $57, $50 or $58
            jump57 = how_many_until(chr(0x57), offset)
            jump50 = how_many_until(chr(0x50), offset)
            jump58 = how_many_until(chr(0x58), offset)
            
            #whichever command comes first
            jump = min([jump57, jump50, jump58])

            end_address = offset + jump - 1 #we want the address before $57

            command = {"type": command_byte,
                       "start_address": offset,
                       "end_address": end_address,
                       "size": jump,
                       "lines": process_00_subcommands(offset+1, end_address),
                      }

            offset += jump
        elif command_byte == 0x17:
            #TX_FAR [pointer][bank]
            pointer_byte1 = ord(extract_maps.rom[offset+1])
            pointer_byte2 = ord(extract_maps.rom[offset+2])
            pointer_bank = ord(extract_maps.rom[offset+3])

            pointer = (pointer_byte1 + (pointer_byte2 << 8))
            pointer = extract_maps.calculate_pointer(pointer, pointer_bank)

            command = {"type": command_byte,
                       "start_address": offset,
                       "end_address": offset + 3, #last byte belonging to this command
                       "pointer": pointer, #parameter
                      }

            offset += 3 + 1
        elif command_byte == 0x50 or command_byte == 0x57 or command_byte == 0x58: #end text
            command = {"type": command_byte,
                       "start_address": offset,
                       "end_address": offset,
                      }

            #this byte simply indicates to end the script
            end = True
            
            #this byte simply indicates to end the script
            if command_byte == 0x50 and ord(extract_maps.rom[offset+1]) == 0x50: #$50$50 means end completely
                end = True
                commands[command_counter+1] = command

                #also save the next byte, before we quit
                commands[command_counter+1]["start_address"] += 1
                commands[command_counter+1]["end_address"] += 1
                add_command_byte_to_totals(command_byte)
            elif command_byte == 0x50: #only end if we started with $0
                if len(commands.keys()) > 0:
                    if commands[0]["type"] == 0x0: end = True
            elif command_byte == 0x57 or command_byte == 0x58: #end completely
                end = True
                offset += 1 #go past this 0x50
        elif command_byte == 0x1:
            #01 = text from RAM. [01][2-byte pointer]
            size = 3 #total size, including the command byte
            pointer_byte1 = ord(extract_maps.rom[offset+1])
            pointer_byte2 = ord(extract_maps.rom[offset+2])
            
            command = {"type": command_byte,
                       "start_address": offset+1,
                       "end_address": offset+2, #last byte belonging to this command
                       "pointer": [pointer_byte1, pointer_byte2], #RAM pointer
                      }
            
            #view near these bytes
            #subsection = extract_maps.rom[offset:offset+size+1] #peak ahead
            #for x in subsection:
            #    print hex(ord(x))
            #print "--"

            offset += 2 + 1 #go to the next byte

            #use this to look at the surrounding bytes
            if debug:
                print "next command is: " + hex(ord(extract_maps.rom[offset])) + " ... we are at command number: " + str(command_counter) + " near " + hex(offset) + " on map_id=" + str(map_id) + " for text_id=" + str(text_id) + " and txfar(recursion)=" + str(txfar)
        elif command_byte == 0x7:
            #07 = shift texts 1 row above (2nd line becomes 1st line); address for next text = 2nd line. [07]
            size = 1
            command = {"type": command_byte,
                       "start_address": offset,
                       "end_address": offset,
                      }
            offset += 1
        elif command_byte == 0x3:
            #03 = set new address in RAM for text. [03][2-byte RAM address]
            size = 3
            command = {"type": command_byte, "start_address": offset, "end_address": offset+2}
            offset += size
        elif command_byte == 0x4: #draw box
            #04 = draw box. [04][2-Byte pointer][height Y][width X]
            size = 5 #including the command
            command = {
                        "type": command_byte,
                        "start_address": offset,
                        "end_address": offset + size,
                        "pointer_bytes": [ord(extract_maps.rom[offset+1]), ord(extract_maps.rom[offset+2])],
                        "y": ord(extract_maps.rom[offset+3]),
                        "x": ord(extract_maps.rom[offset+4]),
                      }
            offset += size + 1
        elif command_byte == 0x5:
            #05 = write text starting at 2nd line of text-box. [05][text][ending command]
            #read until $57, $50 or $58
            jump57 = how_many_until(chr(0x57), offset)
            jump50 = how_many_until(chr(0x50), offset)
            jump58 = how_many_until(chr(0x58), offset)
            
            #whichever command comes first
            jump = min([jump57, jump50, jump58])

            end_address = offset + jump - 1 #we want the address before $57

            command = {"type": command_byte,
                       "start_address": offset,
                       "end_address": end_address,
                       "size": jump,
                       "lines": process_00_subcommands(offset+1, end_address),
                      }
            offset = end_address + 1
        elif command_byte == 0x6:
            #06 = wait for keypress A or B (put blinking arrow in textbox). [06]
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x7:
            #07 = shift texts 1 row above (2nd line becomes 1st line); address for next text = 2nd line. [07]
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x8:
            #08 = asm until whenever
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
            end = True
        elif command_byte == 0x9:
            #09 = write hex-to-dec number from RAM to textbox [09][2-byte RAM address][byte bbbbcccc]
            #  bbbb = how many bytes to read (read number is big-endian)
            #  cccc = how many digits display (decimal)
            #(note: max of decimal digits is 7,i.e. max number correctly displayable is 9999999)
            ram_address_byte1 = ord(extract_maps.rom[offset+1])
            ram_address_byte2 = ord(extract_maps.rom[offset+2])
            read_byte = ord(extract_maps.rom[offset+3])

            command = {
                        "type": command_byte,
                        "address": [ram_address_byte1, ram_address_byte2],
                        "read_byte": read_byte, #split this up when we make a macro for this
                      }

            offset += 4 + 1
        elif command_byte == 0xB:
            #0B = sound_86 (Hiro obtains ITEM)[same as 0F]
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0xE:
            #0E = sound_91 (learnt something)
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0xF:
            #0F = sound_86 (given rare candy)[same as 0B]
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x10:
            #10 = sound_89 (PKMN successfully caught)
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x11:
            #11 = sound_94 (Hiro gives OAK the PARCEL)
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x12:
            #12 = sound_9A (successfully caught)
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x13:
            #13 = sound_98 (song heard when "new data will be added for..")
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x14:
            #14 = MonCry (Nidorina)
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x15:
            #14 = MonCry (Pidgeot)
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x16:
            #14 = MonCry (Dewgong)
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x19:
            #19 = play a 'bump' noise
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x1F:
            #1F = play some pokemon's roar, don't know which..
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x20:
            #20 = oddish roar?
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x3F:
            #3F = some other roar
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x9D:
            #9D = a roar or some other sound, four times in quick succession
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0x76:
            #76 = another roar
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0xCA:
            #CA = stop music, start this other song that i can't name
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0xF6:
            #F6 = play a 'blurp blurp' noise.. like something is increasing
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0xFA:
            #FA = change music to champion song?
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0xFE:
            #FE = another roar, kinda glitchy?
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        elif command_byte == 0xFF:
            #FF = change music to a specific song that i don't know the name of
            command = {"type": command_byte, "start_address": offset, "end_address": offset}
            offset += 1
        else:
            #if len(commands) > 0:
            #   print "Unknown text command " + hex(command_byte) + " at " + hex(offset) + ", script began with " + hex(commands[0]["type"])
            if debug:
                print "Unknown text command at " + hex(offset) + " - command: " + hex(ord(extract_maps.rom[offset])) + " on map_id=" + str(map_id) + " text_id=" + str(text_id)
            
            #end at the first unknown command
            end = True
        add_command_byte_to_totals(command_byte)

        commands[command_counter] = command
        command_counter += 1
    total_text_commands += len(commands)
    return commands

def analyze_texts():
    global should_be_total

    texts = {}
    for map_id in extract_maps.map_headers:
        if map_id in extract_maps.bad_maps: continue #skip
        map2 = extract_maps.map_headers[map_id]
        map2["texts"] = {}
        referenced_texts = map2["referenced_texts"]
        should_be_total += len(referenced_texts)
        texts_pointer = int(map2["texts_pointer"], 16)
        
        #print "Checking texts on... map_id=" + str(map_id) + " and len(referenced_texts)=" + str(len(referenced_texts))
        for text_id in referenced_texts:
            text_pointer = get_text_pointer(texts_pointer, text_id)
            if 0x4000 <= text_pointer <= 0x7fff: #only care about bank when it's between 4000-7fff
                text_pointer = extract_maps.calculate_pointer(text_pointer, int(map2["bank"], 16))
            #print "Working on map id=" + str(map2["id"]) + " and text id=" + str(text_id)
            #print "for map_id=" + str(map_id) + " texts_pointer=" + hex(texts_pointer) + " text_id=" + str(text_id) + " the pointer=" + hex(text_pointer)
            commands = parse_text_script(text_pointer, text_id, map_id)

            #process TX_FARs
            for command_id in commands:
                #skip commands starting with an unknown command byte
                if len(commands[command_id]) == 0: continue

                if commands[command_id]["type"] == 0x17:
                    TX_FAR = parse_text_script(commands[command_id]["pointer"], text_id, map_id, txfar=True)
                    if debug:
                        if len(TX_FAR.keys()) > 0:
                            #print "TX_FAR object: " + str(TX_FAR)
                            print "processing a TX_FAR at " + hex(commands[command_id]["pointer"]) + "... first byte is: " + str(ord(extract_maps.rom[commands[command_id]["pointer"]])) + " .. offset: " + hex(commands[command_id]["pointer"])
                            ##sys.exit(0)

                    commands[command_id]["TX_FAR"] = TX_FAR
                    #map2["texts"][text_id][command_id]["TX_FAR"] = parse_text_script(command["pointer"], text_id, map_id)
            map2["texts"][text_id] = commands

        texts[map_id] = map2["texts"]
        extract_maps.map_headers[map_id]["texts"] = map2["texts"]
    return texts

if __name__ == "__main__":
    extract_maps.load_rom()
    extract_maps.load_map_pointers()
    extract_maps.read_all_map_headers()
    text_output = analyze_texts()
    #print text_output

    print "\n\n---- stats ----\n\n"
    
    popular_text_commands = sorted(totals.iteritems(), key=itemgetter(1), reverse=True)
    #convert the first values (command byte) to hex
    for popular_item in popular_text_commands:
        print hex(popular_item[0]) + " was used " + str(popular_item[1]) + " times."
    #print "popular text commands: " + str(popular_text_commands)
    
    print "total text commands: " + str(total_text_commands)
    print "total text scripts: " + str(should_be_total)