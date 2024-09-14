Route12FossilCave_Script:
    jp EnableAutoTextBoxDrawing

Route12FossilCave_TextPointers:
    def_text_pointers
    dw_const Route12FossilCaveFossilText, TEXT_ROUTE12FOSSILCAVE_FOSSIL

Route12FossilCaveFossilText:
    text_asm
    CheckEvent EVENT_GOT_DOME_FOSSIL
    jr nz, .gotDomeFossil
    CheckEvent EVENT_GOT_HELIX_FOSSIL
    jr nz, .gotHelixFossil
    jr .done
.gotDomeFossil
    lb bc, HELIX_FOSSIL, 1
    jp .giveFossil
.gotHelixFossil
    lb bc, DOME_FOSSIL, 1
.giveFossil
    call GiveItem
    ld a, HS_ROUTE_12_FOSSIL
	ld [wMissableObjectIndex], a
	predef HideObject
    call Route12FossilCave_GotFossil
.done
    jp TextScriptEnd

Route12FossilCave_GotFossil:
    ld hl, .Text
    jp PrintText
.Text
    text_far .GotFossilText
    sound_get_key_item
	text_waitbutton
    text_end
.GotFossilText
    text "<PLAYER> got the"
	line "@"
	text_ram wStringBuffer
	text "!@"
	text_end