ViridianForestWildMons:
	def_grass_wildmons 8 ; encounter rate
IF DEF(_RED)
	db	3, WEEDLE		; 20%
	db	4, WEEDLE		; 20%
	db	5, KAKUNA		; 10%
	db	3, CATERPIE		; 10%
	db	4, CATERPIE		; 10%
	db	5, METAPOD		; 10%
	db	6, BEEDRILL		; 5%
	db	7, BEEDRILL		; 5%
ENDC
IF DEF(_BLUE)
	db	3, CATERPIE		; 20%
	db	4, CATERPIE		; 20%
	db	5, METAPOD		; 10%
	db	3, WEEDLE		; 10%
	db	4, WEEDLE		; 10%
	db	5, KAKUNA		; 10%
	db	6, BUTTERFREE	; 10%
	db	7, BUTTERFREE	; 10%
ENDC
	db	5, PIKACHU	; 5%
	db	5, PIKACHU	; 5%
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
