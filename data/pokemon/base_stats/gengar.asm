	db DEX_GENGAR ; pokedex id

	db  60,  65,  60, 115, 125
	;   hp  atk  def  spd  spc

	db GHOST, DARK ; type
	db CR_VERY_HARD ; catch rate
	db EXP_YIELD_VERY_HIGH ; base exp

	INCBIN "gfx/pokemon/front/gengar.pic", 0, 1 ; sprite dimensions
	dw GengarPicFront, GengarPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH,   TELEPORT,     TOXIC,      FIRE_PUNCH, ICE_PUNCH,   \
			THUNDERPUNCH, THUNDER_WAVE, HYPER_BEAM, AGILITY,    CRUNCH,      \
			THUNDERBOLT,  FOCUS_ENERGY, PSYCHIC_M,  PSYWAVE,    MIMIC,       \
			SHADOW_TEAR,  BIDE,         SLUDGE,     SKULL_BASH, HYPNOSIS,    \
			DREAM_EATER,  VENOM_STRIKE, REST,       PAY_DAY,    HEAVY_SMASH, \
			SUBSTITUTE,                                                      \
			FLY, STRENGTH, FLASH
	; end

	db BANK(GengarPicFront)
	assert BANK(GengarPicFront) == BANK(GengarPicBack)
