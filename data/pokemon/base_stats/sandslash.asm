	db DEX_SANDSLASH ; pokedex id

	db  75, 100, 120,  65,  65
	;   hp  atk  def  spd  spc

	db GROUND, NORMAL ; type
	db CR_NORMAL ; catch rate
	db EXP_YIELD_NORMAL ; base exp

	INCBIN "gfx/pokemon/front/sandslash.pic", 0, 1 ; sprite dimensions
	dw SandslashPicFront, SandslashPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, HEADBUTT,    DOUBLE_KICK, HYPER_BEAM,   AGILITY,    \
			SUBMISSION,   CRUNCH,      EARTHQUAKE,  FOCUS_ENERGY, DIG,        \
			MIMIC,        DOUBLE_DASH, BIDE,        SWIFT,        SKULL_BASH, \
			REST,         PAY_DAY,     HEAVY_SMASH, ROCK_SLIDE,   TWIN_SLICE,   \
			SUBSTITUTE,                                                       \
			CUT,                                    STRENGTH
	; end

	db BANK(SandslashPicFront)
	assert BANK(SandslashPicFront) == BANK(SandslashPicBack)
