PrintConfusion::
	ld a, [de]
	bit CONFUSED, a
	ret z
	ld a, "C"
	ld [hli], a
	ld a, "N"
	ld [hli], a
	ld a, "F"
	ld [hli], a
	ld [hl], "<CNF>"
	ret

PrintStatusAilment::
	ld a, [de]
	bit PSN, a
	jr nz, .psn
	bit BRN, a
	jr nz, .brn
	bit FRZ, a
	jr nz, .frz
	bit PAR, a
	jr nz, .par
	and SLP_MASK
	ret z
	ld a, "S"
	ld [hli], a
	ld a, "L"
	ld [hli], a
	ld a, "P"
	ld [hli], a
	ld [hl], "<SLP>"
	ret
.psn
	ld a, "P"
	ld [hli], a
	ld a, "S"
	ld [hli], a
	ld a, "N"
	ld [hli], a
	ld [hl], "<PSN>"
	ret
.brn
	ld a, "B"
	ld [hli], a
	ld a, "R"
	ld [hli], a
	ld a, "N"
	ld [hli], a
	ld [hl], "<BRN>"
	ret
.frz
	ld a, "F"
	ld [hli], a
	ld a, "R"
	ld [hli], a
	ld a, "Z"
	ld [hli], a
	ld [hl], "<FRZ>"
	ret
.par
	ld a, "P"
	ld [hli], a
	ld a, "A"
	ld [hli], a
	ld a, "R"
	ld [hli], a
	ld [hl], "<PAR>"
	ret
