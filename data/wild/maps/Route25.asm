Route25WildMons:
	def_grass_wildmons 15 ; encounter rate
IF DEF(_RED) || DEF(_BLUE) || DEF(_AMARANTH)
	db 12, ODDISH     ; 20%
	db 12, BELLSPROUT ; 20%
	db 10, EEVEE      ; 10%
	db 12, FARFETCHD  ; 10%
	db 13, POLIWAG    ; 10%
	db 12, ABRA       ; 10%
	db 12, EEVEE      ; 5%
	db 13, FARFETCHD  ; 5%
	db 12, POLIWAG    ; 5%
	db 13, ABRA       ; 5%
ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
