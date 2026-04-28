CinnabarMart_Script:
	jp EnableAutoTextBoxDrawing

CinnabarMart_TextPointers:
	def_text_pointers
	dw_const CinnabarMartClerkText,        TEXT_CINNABARMART_CLERK
	dw_const CinnabarMartTMVendorText,     TEXT_CINNABARMART_TM_VENDOR
	dw_const CinnabarMartSilphWorkerFText, TEXT_CINNABARMART_SILPH_WORKER_F
	dw_const CinnabarMartScientistText,    TEXT_CINNABARMART_SCIENTIST

CinnabarMartSilphWorkerFText:
	text_far _CinnabarMartSilphWorkerFText
	text_end

CinnabarMartScientistText:
	text_far _CinnabarMartScientistText
	text_end

CinnabarMartClerkText:
	script_mart ULTRA_BALL, GREAT_BALL, HYPER_POTION, REPEL, ESCAPE_ROPE, PANACEA, REVIVE

CinnabarMartTMVendorText:
	script_mart TM_ICE_BEAM, TM_HYPER_BEAM, TM_DRAGONBREATH, TM_SHADOW_TEAR, TM_VENOM_STRIKE
