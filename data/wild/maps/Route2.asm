Route2WildMons:
	def_grass_wildmons 25 ; encounter rate
IF DEF(_AMARANTH) || DEF(_RED) || DEF(_BLUE)
	db 3, RATTATA    ; 20%
	db 3, RATTATA    ; 20%
	db 4, NIDORAN_M  ; 10%
	db 4, NIDORAN_F  ; 10%
	db 4, VENONAT    ; 10%
	db 4, VENONAT    ; 10%
	db 5, GROWLITHE  ; 5%
	db 5, GROWLITHE  ; 5%
	db 5, CHARMANDER ; 5%
	db 5, CHARMANDER ; 5%
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
