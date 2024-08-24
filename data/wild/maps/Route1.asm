Route1WildMons:
	def_grass_wildmons 25 ; encounter rate
IF DEF(_AMARANTH) || DEF(_RED) || DEF(_BLUE)
	db 3, RATTATA   ; 20%
	db 3, PIDGEY    ; 20%
	db 4, RATTATA   ; 10%
	db 4, PIDGEY    ; 10%
	db 3, SPEAROW   ; 10%
	db 4, SPEAROW   ; 10%
	db 5, EXEGGCUTE ; 5%
	db 5, EXEGGCUTE ; 5%
	db 5, BULBASAUR ; 5%
	db 5, BULBASAUR ; 5%
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
