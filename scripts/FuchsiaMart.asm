FuchsiaMart_Script:
	jp EnableAutoTextBoxDrawing

FuchsiaMart_TextPointers:
	def_text_pointers
	dw_const FuchsiaMartClerkText,         TEXT_FUCHSIAMART_CLERK
	dw_const FuchsiaMartTMVendorText,      TEXT_FUCHSIAMART_TM_VENDOR
	dw_const FuchsiaMartMiddleAgedManText, TEXT_FUCHSIAMART_MIDDLE_AGED_MAN
	dw_const FuchsiaMartCooltrainerFText,  TEXT_FUCHSIAMART_COOLTRAINER_F

FuchsiaMartMiddleAgedManText:
	text_far _FuchsiaMartMiddleAgedManText
	text_end

FuchsiaMartCooltrainerFText:
	text_far _FuchsiaMartCooltrainerFText
	text_end

FuchsiaMartClerkText:
	script_mart ULTRA_BALL, GREAT_BALL, SUPER_POTION, REVIVE, PANACEA, REPEL

FuchsiaMartTMVendorText:
	script_mart TM_FIRE_PUNCH, TM_ICE_PUNCH, TM_THUNDERPUNCH, TM_MIMIC, TM_SKULL_BASH
