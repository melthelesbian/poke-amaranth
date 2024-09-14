CheapCandyText::
    text_asm
    ld hl, .buyPrompt
    call PrintText
    ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
    call YesNoChoice
    ld a, [wCurrentMenuItem]
    and a
    jr nz, .choseNo
    ldh [hMoney], a
    ldh [hMoney + 1], a
    ld a, $10
    ldh [hMoney + 2], a
    call HasEnoughMoney
    jr nc, .hasEnoughMoney
    ld hl, .notEnoughMoneyText
    jr .printText
.hasEnoughMoney
    lb bc, RARE_CANDY, 10
    call GiveItem
    jr nc, .bagFull
    ; [INFO] Deduct player funds
    xor a
	ld [wPriceTemp], a
	ld [wPriceTemp + 1], a
	ld a, $10
	ld [wPriceTemp + 2], a
	ld hl, wPriceTemp + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
    ld hl, .boughtCandyText
    jr .printText
.bagFull
    ld hl, .bagFullText
.choseNo
    ld hl, .choseNoText
.printText
    call PrintText
.done
    jp TextScriptEnd

.buyPrompt
    text "It's only ¥10 for"
    line "10 candy."

    para "Would you like to"
    line "buy some?"
    done

.notEnoughMoneyText
    text "You don't have"
    line "enough money."
    done

.bagFullText
    text "There's no room"
    line "in your bag."
    done

.boughtCandyText
    text "<PLAYER> got"
    line "10 @"
    text_ram wStringBuffer
    text "!@"
    text_end

.choseNoText
    text "You didn't buy"
    line "the candy."
    done