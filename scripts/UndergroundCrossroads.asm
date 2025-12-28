UndergroundCrossroads_Script:
	jp EnableAutoTextBoxDrawing

UndergroundCrossroads_TextPointers:
	def_text_pointers
	dw_const UndergroundCrossroadsSailorText, TEXT_UNDERGROUNDCROSSROADS_SAILOR
	dw_const UndergroundCrossroadsLittleGirlText, TEXT_UNDERGROUNDCROSSROADS_LITTLE_GIRL

UndergroundCrossroadsSailorText:
	text_asm
	ld a, TRADE_FOR_CLAMPS
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd

UndergroundCrossroadsLittleGirlText:
	text_asm
	ld a, TRADE_FOR_SWIRLS
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd