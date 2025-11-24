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
    hlcoord 0, 14
    lb bc, 2, 18
    call TextBoxBorder

	ld a, [wCurrentMenuItem]
	ld hl, wLoadedMonMoves
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	ld [wMoveNum], a
	farcall PrintMoveScreenDescription
	
	jr .menuLoop
    ret


