VermilionFishingGuruHouse_Script:
	jp EnableAutoTextBoxDrawing

VermilionFishingGuruHouse_TextPointers:
	def_text_pointers
	dw_const VermilionFishingGuruHouseFishingGuruText, TEXT_VERMILIONFISHINGGURUHOUSE_FISHING_GURU

VermilionFishingGuruHouseFishingGuruText:
	text_asm
	ld hl, .WouldYouLikeShellder
	call PrintText
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jp nz, .choseNo
	ldh [hMoney], a
	ldh [hMoney + 2], a
	ld a, $10
	ldh [hMoney + 1], a
	call HasEnoughMoney
	jr nc, .enoughMoney
	ld hl, .NoMoneyText
	jr .printText
.enoughMoney
	lb bc, SHELLDER, 5
	call GivePokemon
	jr nc, .done
	xor a
	ld [wPriceTemp], a
	ld [wPriceTemp + 2], a
	ld a, $10
	ld [wPriceTemp + 1], a
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

.WouldYouLikeShellder
	text_far _VermilionFishingGuruHouseFishingGuruWouldYouLikeShellderText
	text_end

.NoText
	text_far _VermilionFishingGuruHouseFishingGuruNoText
	text_end

.NoMoneyText
	text_far _VermilionFishingGuruHouseFishingGuruNoMoneyText
	text_end
