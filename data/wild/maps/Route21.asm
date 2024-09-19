Route21WildMons:
	def_grass_wildmons 25 ; encounter rate
	db 32, EEVEE      ; 20%
	db 33, PIKACHU    ; 20%
	db 35, IVYSAUR    ; 10%
	db 35, CHARMELEON ; 10%
	db 35, WARTORTLE  ; 10%
	db 34, FARFETCHD  ; 10%
	db 31, BULBASAUR  ; 5%
	db 31, CHARMANDER ; 5%
	db 31, SQUIRTLE   ; 5%
	db 35, FARFETCHD  ; 5%
	end_grass_wildmons

	def_water_wildmons 5 ; encounter rate
	db 35, TENTACOOL  ; 20%
	db 34, SEAKING    ; 20%
	db 33, TENTACOOL  ; 10%
	db 36, GOLDEEN    ; 10%
	db 35, MAGIKARP   ; 10%
	db 33, MAGIKARP   ; 10%
	db 35, TENTACRUEL ; 5%
	db 34, GYARADOS   ; 5%
	db 32, LAPRAS     ; 5%
	db 35, LAPRAS     ; 5%
	end_water_wildmons
