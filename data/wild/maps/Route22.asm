Route22WildMons:
	def_grass_wildmons 25 ; encounter rate
	db  3, MEOWTH		; 20%
	db	3, MANKEY		; 20%
IF DEF(_RED)
	db  4, NIDORAN_M	; 10%
	db  4, NIDORAN_M	; 10%
	db  2, NIDORAN_F	; 10%
	db  4, MEOWTH		; 10%
ENDC
IF DEF(_BLUE) || DEF(_AMARANTH)
	db  4, NIDORAN_F	; 10%
	db  4, NIDORAN_F	; 10%
	db  2, NIDORAN_M	; 10%
	db  4, MANKEY		; 10%
ENDC
	db	5, PSYDUCK		; 5%
	db	5, PSYDUCK		; 5%
	db	5, SQUIRTLE		; 5%
	db	5, SQUIRTLE		; 5%
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
