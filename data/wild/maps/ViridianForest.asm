ViridianForestWildMons:
	def_grass_wildmons 8 ; encounter rate
IF DEF(_AMARANTH) || DEF(_RED) || DEF(_BLUE)
	db 4, CATERPIE   ; 20%
	db 4, WEEDLE     ; 20%
	db 5, CATERPIE   ; 10%
	db 5, WEEDLE     ; 10%
	db 6, METAPOD    ; 10%
	db 6, KAKUNA     ; 10%
	db 7, BUTTERFREE ; 5%
	db 7, BEEDRILL   ; 5%
	db 5, PIKACHU    ; 5%
	db 5, PIKACHU    ; 5%
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
