	db DEX_MANKEY ; pokedex id

	db  40,  80,  35,  70,  45
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db CR_EASY ; catch rate
	db EXP_YIELD_LOW ; base exp

	INCBIN "gfx/pokemon/front/mankey.pic", 0, 1 ; sprite dimensions
	dw MankeyPicFront, MankeyPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH,   SWORDS_DANCE, HEADBUTT,   FIRE_PUNCH,  ICE_PUNCH,   \
			THUNDERPUNCH, DOUBLE_KICK,  AGILITY,    SUBMISSION,  CRUNCH,      \
			EARTHQUAKE,   DIG,          MIMIC,      DOUBLE_DASH, BIDE,        \
			FLARE_RUSH,   SWIFT,        SKULL_BASH, PAY_DAY,     HEAVY_SMASH, \
			ROCK_SLIDE,   TWIN_SLICE,     SUBSTITUTE,                           \
			CUT,                                    STRENGTH
	; end

	db BANK(MankeyPicFront)
	assert BANK(MankeyPicFront) == BANK(MankeyPicBack)
