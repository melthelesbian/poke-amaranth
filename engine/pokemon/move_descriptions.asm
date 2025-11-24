PrintMoveDescription:
	ld a, [wMoveNum]
	dec a
	ld hl, MoveDescriptions
	ld bc, 2
	call AddNTimes
	ld a, [hli]
	ld d, [hl]
	ld e, a
	hlcoord 1, 4
	jp PlaceString

PrintMoveScreenDescription:
	ld a, [wMoveNum]
	dec a 
	ld hl, MoveDescriptions
	ld bc, 2
	call AddNTimes
	ld a, [hli]
	ld d, [hl]
	ld e, a
	hlcoord 1, 15
	jp PlaceString