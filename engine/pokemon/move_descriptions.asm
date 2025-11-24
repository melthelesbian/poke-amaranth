GetMoveDescription:
	ld a, [wMoveNum]
	dec a
	ld hl, MoveDescriptions
	ld bc, 2
	call AddNTimes
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret

PrintLearnMoveDescription:
	call GetMoveDescription
	hlcoord 1, 4
	call PlaceString
	ret

PrintMoveScreenDescription:
	call GetMoveDescription
	hlcoord 1, 15
	call PlaceString
	ret
