UndergroundCrossroads_Script:
	jp EnableAutoTextBoxDrawing

UndergroundCrossroads_TextPointers:
	def_text_pointers
	dw_const UndergroundCrossroadsSailorText, TEXT_UNDERGROUNDCROSSROADS_SAILOR
	dw_const UndergroundCrossroadsYoungsterText, TEXT_UNDERGROUNDCROSSROADS_YOUNGSTER

UndergroundCrossroadsSailorText:
	text_asm
	ld a, TRADE_FOR_CLAMPS
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd

UndergroundCrossroadsYoungsterText:
	text_asm
	ld a, TRADE_FOR_SWISH
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd