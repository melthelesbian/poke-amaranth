FuchsiaFishingGuruHouse_Script:
	jp EnableAutoTextBoxDrawing

FuchsiaFishingGuruHouse_TextPointers:
	def_text_pointers
	dw_const FuchsiaFishingGuruHouseFishingGuruText, TEXT_FUCHSIAFISHINGURUHOUSE_FISHING_GURU

FuchsiaFishingGuruHouseFishingGuruText:
	text_asm
	ld hl, .WouldYouLikeHorsea
	call PrintText
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jp nz, .choseNo
	ldh [hMoney + 1], a
	ldh [hMoney + 2], a
	ld a, $01
	ldh [hMoney], a
	call HasEnoughMoney
	jr nc, .enoughMoney
	ld hl, .NoMoneyText
	jr .printText
.enoughMoney
	lb bc, HORSEA, 5
	call GivePokemon
	jr nc, .done
	xor a
	ld [wPriceTemp + 1], a
	ld [wPriceTemp + 2], a
	ld a, $01
	ld [wPriceTemp], a
	ld hl, wPriceTemp + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	jr .done
.choseNo
	ld hl, .NoText
.printText
	call PrintText
.done
	jp TextScriptEnd

.WouldYouLikeHorsea
	text_far _FuchsiaFishingGuruHouseFishingGuruWouldYouLikeHorseaText
	text_end

.NoText
	text_far _FuchsiaFishingGuruHouseFishingGuruNoText
	text_end

.NoMoneyText
	text_far _FuchsiaFishingGuruHouseFishingGuruNoMoneyText
	text_end
