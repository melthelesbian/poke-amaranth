Route4WildMons:
	def_grass_wildmons 20 ; encounter rate
IF DEF(_AMARANTH) || DEF(_RED) || DEF(_BLUE)
	db 10, RATTATA   ; 20%
	db 11, SPEAROW   ; 20%
	db 12, SANDSHREW ; 10%
	db 13, POLIWAG   ; 10%
	db 11, EKANS     ; 10%
	db 10, FARFETCHD ; 10%
	db 10, SANDSHREW ; 5%
	db 11, POLIWAG   ; 5%
	db 12, EKANS     ; 5%
	db 11, FARFETCHD ; 5%
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
