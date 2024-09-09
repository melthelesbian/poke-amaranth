UndergroundCrossroads_Script:
	jp EnableAutoTextBoxDrawing

UndergroundCrossroads_TextPointers:
	def_text_pointers
	dw_const UndergroundCrossroadsSailorText, TEXT_UNDERGROUNDCROSSROADS_SAILOR

UndergroundCrossroadsSailorText:
	text_asm
	ld a, TRADE_FOR_CLAMPS
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd
