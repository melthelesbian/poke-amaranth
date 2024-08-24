Route22WildMons:
	def_grass_wildmons 25 ; encounter rate
IF DEF(_AMARANTH) || DEF(_RED) || DEF(_BLUE)
	db	3, NIDORAN_M ; 20%
	db	3, NIDORAN_F ; 20%
	db	3, MEOWTH    ; 10%
	db	3, MANKEY    ; 10%
	db	4, MEOWTH    ; 10%
	db	4, MANKEY    ; 10%
	db	5, PSYDUCK   ; 5%
	db	5, PSYDUCK   ; 5%
	db	5, SQUIRTLE  ; 5%
	db	5, SQUIRTLE  ; 5%
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
