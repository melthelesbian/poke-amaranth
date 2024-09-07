MtMoonSquareGiftShop_Script:
	jp EnableAutoTextBoxDrawing

MtMoonSquareGiftShop_TextPointers:
	def_text_pointers
	dw_const MtMoonSquareGiftShop_ClerkText, TEXT_MTMOONSQUAREGIFTSHOP_CLERK
	dw_const MtMoonSquareGiftShop_StoneTagText, TEXT_MTMOONSQUAREGIFTSHOP_STONE_TAG
	dw_const MtMoonSquareGiftShop_TelescopeTagText, TEXT_MTMOONSQUAREGIFTSHOP_TELESCOPE_TAG

MtMoonSquareGiftShop_ClerkText:
	script_mart POKE_DOLL, LEAF_STONE, FIRE_STONE, WATER_STONE, THUNDER_STONE, MOON_STONE

MtMoonSquareGiftShop_StoneTagText:
	text "EVOLUTION STONES"
	line "On sale now!"
	done

MtMoonSquareGiftShop_TelescopeTagText:
	text "STARGAZER 2000"
	line "Buy a telescope"
	cont "today!"
	done