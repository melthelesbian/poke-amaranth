	db DEX_HAUNTER ; pokedex id

	db  45,  50,  45,  95, 115
	;   hp  atk  def  spd  spc

	db GHOST, POISON ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/haunter.pic", 0, 1 ; sprite dimensions
	dw HaunterPicFront, HaunterPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm	TELEPORT,     TOXIC,        THUNDER_WAVE, AGILITY,     CRUNCH, \
			THUNDERBOLT,  FOCUS_ENERGY, PSYCHIC_M,    PSYWAVE,     MIMIC, \
			SHADOW_TEAR,  BIDE,         SLUDGE,       HYPNOSIS,    DREAM_EATER, \
			VENOM_STRIKE, REST,         PAY_DAY,      HEAVY_SMASH, SUBSTITUTE, \
			              FLY,                                     FLASH
	; end

	db BANK(HaunterPicFront)
	assert BANK(HaunterPicFront) == BANK(HaunterPicBack)
