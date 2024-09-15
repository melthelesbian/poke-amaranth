SurfHouse_Script:
	jp EnableAutoTextBoxDrawing

SurfHouse_TextPointers:
	def_text_pointers
	dw_const SurfingDudeText, TEXT_SURFING_DUDE

SurfingDudeText:
	text_asm
	CheckEvent EVENT_GOT_SURFBOARD
	jr nz, .gotSurfboard
	ld hl, .SurfingDudeIntroText
	call PrintText
	ld hl, .DoYouLikeToSurfText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .choseNo
; try to give surfboard
	lb bc, SURFBOARD, 1
	call GiveItem
	jr nc, .bagFull
	SetEvent EVENT_GOT_SURFBOARD
	ld hl, .GiveSurfboardText
	call PrintText
	jr .gotSurfboard
.bagFull
	ld hl, .BagFullText
	jr .printText
.gotSurfboard
	ld hl, .GotSurfboardText
	jr .printText
.choseNo
	ld hl, .ChoseNoText
	jr .printText
.printText
	call PrintText
.done
	jp TextScriptEnd

.SurfingDudeIntroText
	text "Hey, dude! I'm a"
	line "dude that loves"
	cont "to surf!"

	para "I teach all kinds"
	line "of dudes how to"
	cont "ride the waves!"
	prompt

.DoYouLikeToSurfText
	text "Do you want to"
	line "learn to be a"
	cont "surfing dude too?"
	done

.ChoseNoText
	text "Bummer, dude, but"
	line "come back if you"
	cont "change your mind."

	para "Anyone can be a"
	line "surfing dude!"
	done

.BagFullText
	text "Your bag is full,"
	line "dude. Come back"
	cont "if you make room."
	done

.GiveSurfboardText
	text "<PLAYER> got a"
	line "SURFBOARD!"
	prompt

.GotSurfboardText
	text "Get out there and"
	line "get your surf on!"
	done