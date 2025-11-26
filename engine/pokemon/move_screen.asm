MoveScreen:
	call LoadMonData
	call GBPalWhiteOut
	call ClearScreen
	
	; Count non-empty moves
	ld hl, wLoadedMonMoves
	ld b, 0
    ld c, NUM_MOVES
.countMoves
	ld a, [hli]
	and a
	jr z, .doneCount
	inc b
    dec c
	jr nz, .countMoves
.doneCount
	ld a, b
	and a
	ret z  ; Exit if no moves
	dec a
	ld [wMaxMenuItem], a
	
	; Draw border and format moves
	hlcoord 0, 0
	lb bc, 9, 18
	call TextBoxBorder

	ld bc, NUM_MOVES + 1
	ld hl, wMoves
	call FillMemory
	ld hl, wLoadedMonMoves
	ld de, wMoves
	ld bc, NUM_MOVES
	call CopyData
	callfar FormatMovesString
	hlcoord 2, 2
	ld de, wMovesString
	call PlaceString
	
	; print the Pokemon's nickname
	ld hl, wPartyMonNicks
	ld a, [wWhichPokemon]
	call GetPartyMonName
	hlcoord 4, 0
	call PlaceString

; Set up menu cursor position
	ld a, 2  ; Y position (row 2)
	ld [wTopMenuItemY], a
	ld a, 1  ; X position (column 0)
	ld [wTopMenuItemX], a
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld a, A_BUTTON | B_BUTTON
	ld [wMenuWatchedKeys], a
	xor a
	ld [wMenuWrappingEnabled], a
		
	call GBPalNormal
	
.menuLoop
	call HandleMenuInput
	bit 1, a  ; B button
	ret nz
	
	; A pressed - show move info
    hlcoord 0, 11
    lb bc, 5, 18
    call TextBoxBorder

	ld a, [wCurrentMenuItem]
	ld hl, wLoadedMonMoves
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	ld [wMoveNum], a
    ld [wd11e], a
	
    ; read move data into buffer
    ld a, [wMoveNum]
	dec a
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld de, wBuffer
	ld a, BANK(Moves)
	call FarCopyData

	; move info labels
	hlcoord 1, 12
	ld de, MoveScreenInfoLabels
	call PlaceString
	; place the move's type
	hlcoord 1, 12
	predef PrintBufferedMoveType
	; place the move's power
	hlcoord 6, 13
	ld de, wBuffer + 2
	ld a, [de]
	cp 1
	jr z, .nullString
	and a
	jr z, .nullString
	jr .notZero1
.nullString
	ld de, NullMoveScreenInfoLabel
	call PlaceString
	jr .powerDone
.notZero1
	lb bc, LEFT_ALIGN | 1, 3
	call PrintNumber
.powerDone
	; place the move's accuracy
	ld a, [wBuffer + 4]
	ld [wPlayerMoveAccuracy], a
	farcall ConvertPercentagesBattle
	ld de, wBuffer + 6
	hlcoord 15, 13
	lb bc, 1, 3
	call PrintNumber
.printPP
	ld a, [wBuffer + 5]
	ld de, wBuffer + 5
	hlcoord 14, 12
	lb bc, LEFT_ALIGN | 1, 3
	call PrintNumber
	
	; move effect icons
	call PrintMoveScreenEffectIcons
	farcall PrintMoveScreenDescription

	jp .menuLoop
    ret


MoveScreenInfoLabels:
	db   "         PP:"
	feed "PWR:     ACC:    %"
	db "@"

NullMoveScreenInfoLabel:
	db "---@"

MACRO ms_print_handler
	dbw \1, PrintMoveScreenEffectIcons.\2
ENDM

MoveScreenEffectPrintHandlers:
	ms_print_handler POISON_EFFECT             , printPSN
	ms_print_handler POISON_SIDE_EFFECT1       , printPSN
	ms_print_handler POISON_SIDE_EFFECT2       , printPSN
	ms_print_handler SLEEP_EFFECT              , printSLP
	ms_print_handler CONFUSION_EFFECT          , printCNF
	ms_print_handler CONFUSION_SIDE_EFFECT     , printCNF
	ms_print_handler FREEZE_SIDE_EFFECT        , printFRZ
	ms_print_handler BURN_SIDE_EFFECT1         , printBRN
	ms_print_handler BURN_SIDE_EFFECT2         , printBRN
	ms_print_handler PARALYZE_EFFECT           , printPAR
	ms_print_handler PARALYZE_SIDE_EFFECT1     , printPAR
	ms_print_handler PARALYZE_SIDE_EFFECT2     , printPAR
	ms_print_handler ATTACK_UP1_EFFECT         , printStatUp1
	ms_print_handler DEFENSE_UP1_EFFECT        , printStatUp1
	ms_print_handler SPEED_UP1_EFFECT          , printStatUp1
	ms_print_handler SPECIAL_UP1_EFFECT        , printStatUp1
	ms_print_handler ATTACK_UP2_EFFECT         , printStatUp2
	ms_print_handler DEFENSE_UP2_EFFECT        , printStatUp2
	ms_print_handler SPEED_UP2_EFFECT          , printStatUp2
	ms_print_handler SPECIAL_UP2_EFFECT        , printStatUp2
	ms_print_handler ATTACK_DOWN1_EFFECT       , printStatDown1
	ms_print_handler ATTACK_DOWN_SIDE_EFFECT   , printStatDown1
	ms_print_handler DEFENSE_DOWN1_EFFECT      , printStatDown1
	ms_print_handler DEFENSE_DOWN_SIDE_EFFECT  , printStatDown1
	ms_print_handler SPEED_DOWN1_EFFECT        , printStatDown1
	ms_print_handler SPEED_DOWN_SIDE_EFFECT    , printStatDown1
	ms_print_handler SPECIAL_DOWN1_EFFECT      , printStatDown1
	ms_print_handler SPECIAL_DOWN_SIDE_EFFECT  , printStatDown1
	ms_print_handler ATTACK_DOWN2_EFFECT       , printStatDown2
	ms_print_handler DEFENSE_DOWN2_EFFECT      , printStatDown2
	ms_print_handler SPEED_DOWN2_EFFECT        , printStatDown2
	ms_print_handler SPECIAL_DOWN2_EFFECT      , printStatDown2
	ms_print_handler HEAL_EFFECT               , printHeal
	ms_print_handler DRAIN_HP_EFFECT           , printHeal
	ms_print_handler LEECH_SEED_EFFECT         , printHeal
	ms_print_handler RECOIL_EFFECT             , printRecoil
	ms_print_handler FLINCH_SIDE_EFFECT1       , printFlinch
	ms_print_handler FLINCH_SIDE_EFFECT2       , printFlinch
	ms_print_handler CHARGE_EFFECT             , printMultiTurn
	ms_print_handler FLY_EFFECT                , printMultiTurn
	ms_print_handler HYPER_BEAM_EFFECT         , printMultiTurn
	ms_print_handler ATTACK_TWICE_EFFECT       , printMultiHit1
	ms_print_handler TWO_TO_FIVE_ATTACKS_EFFECT, printMultiHit2
	ms_print_handler TWINEEDLE_EFFECT          , printMultiHit1
	ms_print_handler TRAPPING_EFFECT           , printTrapping
	ms_print_handler RAGE_EFFECT               , printRage
	ms_print_handler THRASH_PETAL_DANCE_EFFECT , printRage
	db -1

MoveScreenEffectHighCritical: INCLUDE "data/battle/critical_hit_moves.asm"


PrintMoveScreenEffectIcons:
.printHighCrit
	ld a, [wd11e]
	ld b, a
	ld hl, MoveScreenEffectHighCritical
.hcLoop
	ld a, [hli] ; read move from table
	cp b
	jr z, .highCritMove
	inc a
	jr nz, .hcLoop
	jr .statusEffect
.highCritMove
	hlcoord 18, 1
	ld [hl], '<CH>'
	jp .finished
.statusEffect
	ld a, [wBuffer + 1]
.noAdditionalEffect
	cp NO_ADDITIONAL_EFFECT
	jp z, .finished
	cp SPLASH_EFFECT
	jp z, .finished
.processMoveEffectPrintHandlers
	ld hl, MoveScreenEffectPrintHandlers
	ld de, 3
	call IsInArray
	jr c, .found
	jp .printUnique
.found
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
.printPSN
	hlcoord 18, 12
	ld [hl], '<PSN>'
	jp .finished
.printSLP
	hlcoord 18, 12
	ld [hl], '<SLP>'
	jp .finished
.printCNF
	hlcoord 18, 12
	ld [hl], '<CNF>'
	jp .finished
.printFRZ
	hlcoord 18, 12
	ld [hl], '<FRZ>'
	jp .finished
.printBRN
	hlcoord 18, 12
	ld [hl], '<BRN>'
	jp .finished
.printPAR
	hlcoord 18, 12
	ld [hl], '<PAR>'
	jp .finished
.printStatUp1
	hlcoord 18, 12
	ld [hl], '<U1>'
	jp .finished
.printStatUp2
	hlcoord 18, 12
	ld [hl], '<U2>'
	jp .finished
.printStatDown1
	hlcoord 18, 12
	ld [hl], '<D1>'
	jp .finished
.printStatDown2
	hlcoord 18, 12
	ld [hl], '<D2>'
	jp .finished
.printHeal
	hlcoord 18, 12
	ld [hl], '<HEART>'
	jp .finished
.printRecoil
	hlcoord 18, 12
	ld [hl], '<BOUNCE>'
	jp .finished
.printFlinch
	hlcoord 18, 12
	ld [hl], '<PAIN>'
	jp .finished
.printMultiTurn
	hlcoord 18, 12
	ld [hl], '<CLOCK>'
	jp .finished
.printMultiHit1
	hlcoord 8, 13
	ld [hl], '+'
	jp .finished
.printMultiHit2
	hlcoord 8, 13
	ld [hl], '×'
	jp .finished
.printTrapping
	hlcoord 18, 12
	ld [hl], '<SPIRAL>'
	jp .finished
.printRage
	hlcoord 18, 12
	ld [hl], '<ANGRY>'
	jp .finished
; [INFO] default to unique effect
.printUnique
	hlcoord 18, 12
	ld [hl], '<SPARKLE>'
.finished
	ret
