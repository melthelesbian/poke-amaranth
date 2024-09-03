Route12FishingGuruHouse_Script:
	jp EnableAutoTextBoxDrawing

Route12FishingGuruHouse_TextPointers:
	def_text_pointers
	dw_const Route12FishingGuruHouseFishingGuruText, TEXT_ROUTE12SUPERRODHOUSE_FISHING_GURU

Route12FishingGuruHouseFishingGuruText:
	text_asm
	ld hl, .WouldYouLikeStaryu
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
	ld a, $50
	ldh [hMoney + 1], a
	call HasEnoughMoney
	jr nc, .enoughMoney
	ld hl, .NoMoneyText
	jr .printText
.enoughMoney
	lb bc, STARYU, 5
	call GivePokemon
	jr nc, .done
	xor a
	ld [wPriceTemp], a
	ld [wPriceTemp + 2], a
	ld a, $50
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

.WouldYouLikeStaryu
	text_far _Route12FishingGuruHouseFishingGuruWouldYouLikeStaryuText
	text_end

.NoText
	text_far _Route12FishingGuruHouseFishingGuruNoText
	text_end

.NoMoneyText
	text_far _Route12FishingGuruHouseFishingGuruNoMoneyText
	text_end
