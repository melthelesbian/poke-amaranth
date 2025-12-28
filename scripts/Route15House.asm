Route15House_Script:
	jp EnableAutoTextBoxDrawing

Route15House_TextPointers:
	def_text_pointers
	dw_const Route15HouseHousesitterText, TEXT_ROUTE15HOUSE_HOUSESITTER
	dw_const Route15HouseTradeGirlText, TEXT_ROUTE15HOUSE_TRADE_GIRL
	dw_const Route15HouseCollectorText, TEXT_ROUTE15HOUSE_COLLECTOR
	dw_const Route15HouseFriendText, TEXT_ROUTE15HOUSE_FRIEND
	dw_const Route15HouseClefableText, TEXT_ROUTE15HOUSE_CLEFABLE
	dw_const Route15HouseFarfetchdText, TEXT_ROUTE15HOUSE_FARFETCHD

Route15HouseHousesitterText:
	text "This is the dev's"
	line "house, but she's"
	cont "gone to CELADON"
	cont "CITY for work."

	para "I'm looking after"
	line "her #MON while"
	cont "she's away."
	done

Route15HouseTradeGirlText:
	text_asm
	ld a, TRADE_FOR_HOPE
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd

Route15HouseCollectorText:
	text_asm
    ld hl, .GreetingText
    call PrintText
    ld hl, .MartList
    call LoadItemList
    ld a, PRICEDITEMLISTMENU
    ld [wListMenuID], a
    farcall DisplayPokemartDialogue_
    jp TextScriptEnd

.GreetingText
    text "I love EVOLUTION"
    line "STONES! Want one?"
    done

.MartList
    db 5
	db LEAF_STONE
	db FIRE_STONE
	db WATER_STONE
	db THUNDER_STONE
	db MOON_STONE
    db -1

Route15HouseFriendText:
	text "My friend lives in"
	line "another region."

	para "She told me about"
	line "a #MON named"
	cont "ZIGZAGOON!"

	para "It sounds so cute!"
	done

Route15HouseClefableText:
	text "CLEFABLE: Clefaaa-"
	line "ble. Cle-fa-ble!"
	done

Route15HouseFarfetchdText:
	text "FARFETCH'D: ……………"
	line "…………… Farfetch'd?"
	cont "Far-Farfetch'd!"

	para "Farfetch'd fetch'd"
	line "Far-far-fetch'd!"
	done