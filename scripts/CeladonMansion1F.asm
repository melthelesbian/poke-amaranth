CeladonMansion1F_Script:
	jp EnableAutoTextBoxDrawing

CeladonMansion1F_TextPointers:
	def_text_pointers
	dw_const CeladonMansion1FMeowthText,            TEXT_CELADONMANSION1F_MEOWTH
	dw_const CeladonMansion1FGrannyText,            TEXT_CELADONMANSION1F_GRANNY
	dw_const CeladonMansion1FClefairyText,          TEXT_CELADONMANSION1F_CLEFAIRY
	dw_const CeladonMansion1FNidoranFText,          TEXT_CELADONMANSION1F_NIDORANF
	dw_const CeladonMansion1FManagersSuiteSignText, TEXT_CELADONMANSION1F_MANAGERS_SUITE_SIGN

CeladonMansion1_PlayCryScript:
	call PlayCry
	jp TextScriptEnd

CeladonMansion1FMeowthText:
	text_far _CeladonMansion1FMeowthText
	text_asm
	ld a, MEOWTH
	jp CeladonMansion1_PlayCryScript

CeladonMansion1FGrannyText:
	text_asm
	CheckEvent EVENT_GOT_TEA_SHIPMENT
	jr nz, .meowth_brings_money_home
	ld hl, CeladonMansion1FGrannyRequestHelpText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .said_no
.give_tea_shipment
	lb bc, TEA_SHIPMENT, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, CeladonMansion1FGrannyThankYouText
	call PrintText
	SetEvent EVENT_GOT_TEA_SHIPMENT
	jr .done
.said_no
	ld hl, CeladonMansion1FGrannyPlayerSaidNoText
	call PrintText
	jr .done
.bag_full
	ld hl, CeladonMansion1FGrannyBagFullText
	call PrintText
	jr .done
.meowth_brings_money_home
	ld hl, CeladonMansion1FGrannyMeowthBringsMoneyHomeText
	call PrintText
.done
	jp TextScriptEnd

CeladonMansion1FGrannyRequestHelpText:
	text_far _CeladonMansion1FGrannyRequestHelpText
	text_end

CeladonMansion1FGrannyThankYouText:
	text_far _CeladonMansion1FGrannyThankYouText
	text_far _CeladonMansion1FGrannyTeaShipmentText
	sound_get_key_item
	text_far _CeladonMansion1FGrannyPleaseDeliverText
	text_end

CeladonMansion1FGrannyPlayerSaidNoText:
	text_far _CeladonMansion1FGrannyPlayerSaidNoText
	text_end

CeladonMansion1FGrannyBagFullText:
	text_far _CeladonMansion1FGrannyBagFullText
	text_end

CeladonMansion1FGrannyMeowthBringsMoneyHomeText:
	text_far _CeladonMansion1FGrannyMeowthBringsMoneyHomeText
	text_end

CeladonMansion1FClefairyText:
	text_far _CeladonMansion1FClefairyText
	text_asm
	ld a, CLEFAIRY
	jp CeladonMansion1_PlayCryScript

CeladonMansion1FNidoranFText:
	text_far _CeladonMansion1FNidoranFText
	text_asm
	ld a, NIDORAN_F
	jp CeladonMansion1_PlayCryScript

CeladonMansion1FManagersSuiteSignText:
	text_far _CeladonMansion1FManagersSuiteSignText
	text_end
