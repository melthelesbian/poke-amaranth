IF DEF(_AMARANTH)
DefaultNamesPlayer:
	db "NEW NAME"
	next "AMAR"
	next "RED"
	next "BLUE"
	db   "@"

DefaultNamesRival:
	db "NEW NAME"
	next "TONY"
	next "BLUE"
	next "RED"
	db   "@"
ENDC

IF DEF(_RED)
DefaultNamesPlayer:
	db   "NEW NAME"
	next "RED"
	next "ASH"
	next "JACK"
	db   "@"

DefaultNamesRival:
	db   "NEW NAME"
	next "BLUE"
	next "GARY"
	next "JOHN"
	db   "@"
ENDC

IF DEF(_BLUE)
DefaultNamesPlayer:
	db   "NEW NAME"
	next "BLUE"
	next "GARY"
	next "JOHN"
	db   "@"

DefaultNamesRival:
	db   "NEW NAME"
	next "RED"
	next "ASH"
	next "JACK"
	db   "@"
ENDC
