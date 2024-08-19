ViridianForestWildMons:
	def_grass_wildmons 8 ; encounter rate
IF DEF(_RED)
	db	4, WEEDLE	; 20%
	db	6, KAKUNA	; 20%
	db	3, CATERPIE	; 15%
	db	5, WEEDLE	; 10%
	db	6, METAPOD	; 10%
ENDC
IF DEF(_BLUE)
	db	4, CATERPIE	; 20%
	db	6, METAPOD	; 20%
	db	3, WEEDLE	; 15%
	db	5, CATERPIE	; 10%
	db	6, KAKUNA	; 10%
ENDC
	db	5, VENONAT	; 10%
	db	4, VENONAT	; 5%
	db	3, PIKACHU	; 5%
	db	4, PIKACHU	; 4%
	db	5, PIKACHU	; 1%
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
