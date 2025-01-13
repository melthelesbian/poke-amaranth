	db DEX_MEWTWO ; pokedex id

	db 105, 110,  90, 130, 125
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db CR_CHALLENGING ; catch rate
	db EXP_YIELD_VERY_HIGH ; base exp

	INCBIN "gfx/pokemon/front/mewtwo.pic", 0, 1 ; sprite dimensions
	dw MewtwoPicFront, MewtwoPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH,  HEADBUTT,     TELEPORT,    TOXIC,        FIRE_PUNCH, \
			ICE_PUNCH,   THUNDERPUNCH, DOUBLE_KICK, THUNDER_WAVE, HYPER_BEAM, \
			AGILITY,     SUBMISSION,   CRUNCH,      FOCUS_ENERGY, PSYCHIC_M,  \
			PSYWAVE,     MIMIC,        SHADOW_TEAR, BIDE,         FLARE_RUSH, \
			SWIFT,       SKULL_BASH,   HYPNOSIS,    REST,         PAY_DAY,    \
			HEAVY_SMASH, SUBSTITUTE,                                          \
			STRENGTH,                                             FLASH
	; end

	db BANK(MewtwoPicFront)
	assert BANK(MewtwoPicFront) == BANK(MewtwoPicBack)
