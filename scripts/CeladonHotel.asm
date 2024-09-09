CeladonHotel_Script:
	jp EnableAutoTextBoxDrawing

CeladonHotel_TextPointers:
	def_text_pointers
	dw_const CeladonHotelGrannyText,    TEXT_CELADONHOTEL_GRANNY
	dw_const CeladonHotelBeautyText,    TEXT_CELADONHOTEL_BEAUTY
	dw_const CeladonHotelGirlText,      TEXT_CELADONHOTEL_GIRL

CeladonHotelGrannyText:
	text_far _CeladonHotelGrannyText
	text_end

CeladonHotelBeautyText:
	text_far _CeladonHotelBeautyText
	text_end

CeladonHotelGirlText:
	text_far _CeladonHotelGirlText
	text_asm
	ld a, TRADE_FOR_SAILOR
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd
