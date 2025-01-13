	db DEX_MUK ; pokedex id

	db 105, 105,  75,  50, 100
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/muk.pic", 0, 1 ; sprite dimensions
	dw MukPicFront, MukPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH, TOXIC,        FIRE_PUNCH, ICE_PUNCH, THUNDERPUNCH, \
			HYPER_BEAM, LIGHT_SCREEN, REFLECT,    AGILITY,   SUBMISSION,   \
			CRUNCH,     MEGA_DRAIN,   DIG,        MIMIC,     BIDE,         \
			SLUDGE,     VENOM_STRIKE, REST,       PAY_DAY,   HEAVY_SMASH,  \
			SUBSTITUTE,                                                    \
			                          SURF,       STRENGTH
	; end

	db BANK(MukPicFront)
	assert BANK(MukPicFront) == BANK(MukPicBack)
