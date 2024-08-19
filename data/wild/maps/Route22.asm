Route22WildMons:
	def_grass_wildmons 25 ; encounter rate
	db  4, MEOWTH		; 20%
	db	3, MANKEY		; 20%
	db	4, MANKEY		; 15%
IF DEF(_RED)
	db  4, NIDORAN_M	; 10%
	db  4, NIDORAN_M	; 10%
	db  2, NIDORAN_F	; 10%
	db  3, NIDORAN_F	; 5%
ENDC
IF DEF(_BLUE)
	db  4, NIDORAN_F	; 10%
	db  4, NIDORAN_F	; 10%
	db  2, NIDORAN_M	; 10%
	db  3, NIDORAN_M	; 5%
ENDC
	db	5, SQUIRTLE		; 5%
	db	5, SQUIRTLE		; 4%
	db	5, SQUIRTLE		; 1% 
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
