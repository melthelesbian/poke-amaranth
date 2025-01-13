	db DEX_GRIMER ; pokedex id

	db  80,  80,  50,  25,  50
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db CR_VERY_EASY ; catch rate
	db EXP_YIELD_VERY_LOW ; base exp

	INCBIN "gfx/pokemon/front/grimer.pic", 0, 1 ; sprite dimensions
	dw GrimerPicFront, GrimerPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH,   TOXIC,   FIRE_PUNCH, ICE_PUNCH,   THUNDERPUNCH, \
			LIGHT_SCREEN, REFLECT, AGILITY,    SUBMISSION,  CRUNCH,       \
			MEGA_DRAIN,   DIG,     MIMIC,      BIDE,        SLUDGE,       \ 
			VENOM_STRIKE, REST,    PAY_DAY,    HEAVY_SMASH, SUBSTITUTE,   \
			                       SURF,       STRENGTH
	; end

	db BANK(GrimerPicFront)
	assert BANK(GrimerPicFront) == BANK(GrimerPicBack)
