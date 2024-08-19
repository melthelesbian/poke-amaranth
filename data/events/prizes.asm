PrizeDifferentMenuPtrs:
	dw PrizeMenuMon1Entries, PrizeMenuMon1Cost
	dw PrizeMenuMon2Entries, PrizeMenuMon2Cost
	dw PrizeMenuTMsEntries,  PrizeMenuTMsCost

NoThanksText:
	db "NO THANKS@"

PrizeMenuMon1Entries:
	db ABRA
	db CLEFAIRY
IF DEF(_AMARANTH)
	db JIGGLYPUFF
ENDC
IF DEF(_RED)
	db NIDORINA
ENDC
IF DEF(_BLUE)
	db NIDORINO
ENDC
	db "@"

PrizeMenuMon1Cost:
	bcd2 200
	bcd2 750
	bcd2 1250
	db "@"

PrizeMenuMon2Entries:
IF DEF(_AMARANTH)
    db TANGELA
ENDC
IF DEF(_RED)
	db SCYTHER
ENDC
IF DEF(_BLUE)
	db PINSIR
ENDC
	db DRATINI
	db PORYGON
	db "@"

PrizeMenuMon2Cost:
	bcd2 2500
	bcd2 4000
	bcd2 7500
	db "@"

PrizeMenuTMsEntries:
	db TM_SUBSTITUTE
	db TM_DRAGON_RAGE
	db TM_HYPER_BEAM
	db "@"

PrizeMenuTMsCost:
	bcd2 1000
	bcd2 2500
	bcd2 5000
	db "@"
