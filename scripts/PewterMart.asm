PewterMart_Script:
	call EnableAutoTextBoxDrawing
	ld a, TRUE
	ld [wAutoTextBoxDrawingControl], a
	ret

PewterMart_TextPointers:
	def_text_pointers
	dw_const PewterMartClerkText,     TEXT_PEWTERMART_CLERK
	dw_const PewterMartTMVendorText,  TEXT_PEWTERMART_TM_VENDOR
	dw_const PewterMartYoungsterText, TEXT_PEWTERMART_YOUNGSTER
	dw_const PewterMartSuperNerdText, TEXT_PEWTERMART_SUPER_NERD

PewterMartYoungsterText:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text:
	text_far _PewterMartYoungsterText
	text_end

PewterMartSuperNerdText:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text:
	text_far _PewterMartSuperNerdText
	text_end

PewterMartClerkText:
	script_mart POKE_BALL, POTION, ESCAPE_ROPE, REPEL, PANACEA

PewterMartTMVendorText:
	script_mart TM_DOUBLE_KICK, TM_PAY_DAY, TM_ROCK_SLIDE, TM_TWIN_SLICE
