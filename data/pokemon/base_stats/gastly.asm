	db DEX_GASTLY ; pokedex id

	db  30,  35,  30,  80, 100
	;   hp  atk  def  spd  spc

	db GHOST, POISON ; type
	db CR_EASY ; catch rate
	db EXP_YIELD_LOW ; base exp

	INCBIN "gfx/pokemon/front/gastly.pic", 0, 1 ; sprite dimensions
	dw GastlyPicFront, GastlyPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm	TELEPORT,     TOXIC,        THUNDER_WAVE, AGILITY,     CRUNCH,      \
			THUNDERBOLT,  FOCUS_ENERGY, PSYCHIC_M,    PSYWAVE,     MIMIC,       \
			SHADOW_TEAR,  BIDE,         SLUDGE,       HYPNOSIS,    DREAM_EATER, \
			VENOM_STRIKE, REST,         PAY_DAY,      HEAVY_SMASH, SUBSTITUTE,  \
			              FLY,                                     FLASH
	; end

	db BANK(GastlyPicFront)
	assert BANK(GastlyPicFront) == BANK(GastlyPicBack)
