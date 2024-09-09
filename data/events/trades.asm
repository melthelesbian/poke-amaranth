TradeMons:
; entries correspond to TRADE_FOR_* constants
	table_width 3 + NAME_LENGTH, TradeMons
	; give mon, get mon, dialog id, nickname
	; The two instances of TRADE_DIALOGSET_EVOLUTION are a leftover
	; from the Japanese Blue trades, which used species that evolve.
	; Japanese Red and Green used TRADE_DIALOGSET_CASUAL, and had
	; the same species as English Red and Blue.
	db NIDORINO,   NIDORINA,  TRADE_DIALOGSET_EVOLUTION, "NINA@@@@@@@" ; Route 11
	db MR_MIME,    KADABRA,   TRADE_DIALOGSET_CASUAL,    "ALANA@@@@@@" ; Route 18
	db CLEFAIRY,   CHANSEY,   TRADE_DIALOGSET_CASUAL,    "HOPE@@@@@@@" ; Route 25
	db PONYTA,     SEEL,      TRADE_DIALOGSET_HAPPY,     "SAILOR@@@@@" ; Celadon Hotel
	db SPEAROW,    FARFETCHD, TRADE_DIALOGSET_HAPPY,     "DUX@@@@@@@@" ; Vermilion City
	db SLOWPOKE,   MAGMAR,    TRADE_DIALOGSET_CASUAL,    "MAGMARC@@@@" ; Cerulean City
	db POLIWHIRL,  JYNX,      TRADE_DIALOGSET_EVOLUTION, "LOLA@@@@@@@" ; Route 2
	db HAUNTER,    LAPRAS,    TRADE_DIALOGSET_EVOLUTION, "AURORA@@@@@" ; Pokemon Tower 1F
	db SHELLDER,   KRABBY,    TRADE_DIALOGSET_HAPPY,     "CLAMPS@@@@@" ; Underground Crossroads
	db NIDORINA,   NIDORINO,  TRADE_DIALOGSET_EVOLUTION, "ROYAL@@@@@@" ; Route 5 Underground
	db PRIMEAPE,   MACHOKE,   TRADE_DIALOGSET_CASUAL,    "DORIS@@@@@@" ; Cinnabar Lab
	db MUK,        HAUNTER,   TRADE_DIALOGSET_HAPPY,     "SPECTRE@@@@" ; Cinnabar Lab
	db RHYDON,     GRAVELER,  TRADE_DIALOGSET_CASUAL,    "ROCKETTE@@@" ; Cinnabar Lab
	assert_table_length NUM_NPC_TRADES
