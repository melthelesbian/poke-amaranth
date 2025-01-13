	db DEX_ALAKAZAM ; pokedex id

	db  55,  50,  45, 120, 135
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db CR_VERY_HARD ; catch rate
	db EXP_YIELD_VERY_HIGH ; base exp

	INCBIN "gfx/pokemon/front/alakazam.pic", 0, 1 ; sprite dimensions
	dw AlakazamPicFront, AlakazamPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH,   HEADBUTT,     TELEPORT,     FIRE_PUNCH, ICE_PUNCH, \
			THUNDERPUNCH, THUNDER_WAVE, LIGHT_SCREEN, REFLECT,    PSYCHIC_M, \
			PSYWAVE,      MIMIC,        BIDE,         SWIFT,      REST,      \
			SUBSTITUTE,   METRONOME,                                         \
			                                                      FLASH
	; end

	db BANK(AlakazamPicFront)
	assert BANK(AlakazamPicFront) == BANK(AlakazamPicBack)
