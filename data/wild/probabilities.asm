WildMonEncounterSlotChances:
; There are 10 slots for wild pokemon, and this is the table that defines how common each of
; those 10 slots is. A random number is generated and then the first byte of each pair in this
; table is compared against that random number. If the random number is less than or equal
; to the first byte, then that slot is chosen.  The second byte is double the slot number.
	db  51, $00 ; 52/256 = 20.3% chance of slot 0
	db 103, $02 ; 52/256 = 20.3% chance of slot 1
	db 128, $04 ; 25/256 =  9.8% chance of slot 2
	db 153, $06 ; 25/256 =  9.8% chance of slot 3
	db 178, $08 ; 25/256 =  9.8% chance of slot 4
	db 203, $0A ; 25/256 =  9.8% chance of slot 5
	db 216, $0C ; 13/256 =  5.1% chance of slot 6
	db 229, $0E ; 13/256 =  5.1% chance of slot 7
	db 242, $10 ; 13/256 =  5.1% chance of slot 8
	db 255, $12 ; 13/256 =  5.1% chance of slot 9
