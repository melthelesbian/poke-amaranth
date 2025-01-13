	db DEX_ABRA ; pokedex id

	db  25,  20,  15,  90, 105
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db CR_VERY_EASY ; catch rate
	db EXP_YIELD_VERY_LOW ; base exp

	INCBIN "gfx/pokemon/front/abra.pic", 0, 1 ; sprite dimensions
	dw AbraPicFront, AbraPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm 	MEGA_PUNCH, HEADBUTT,  TELEPORT,   THUNDER_WAVE, LIGHT_SCREEN, \
			REFLECT,    PSYCHIC_M, PSYWAVE,    MIMIC,        BIDE,         \  
			SWIFT,      REST,      SUBSTITUTE, METRONOME,                  \
			                                                 FLASH
	; end

	db BANK(AbraPicFront)
	assert BANK(AbraPicFront) == BANK(AbraPicBack)
