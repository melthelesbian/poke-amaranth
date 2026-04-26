	db DEX_SANDSHREW ; pokedex id

	db  50,  75,  90,  40,  35
	;   hp  atk  def  spd  spc

	db GROUND, NORMAL ; type
	db CR_TRIVIAL ; catch rate
	db EXP_YIELD_VERY_LOW ; base exp

	INCBIN "gfx/pokemon/front/sandshrew.pic", 0, 1 ; sprite dimensions
	dw SandshrewPicFront, SandshrewPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, HEADBUTT,   DOUBLE_KICK,  AGILITY,    SUBMISSION, \
			CRUNCH,       EARTHQUAKE, FOCUS_ENERGY, DIG,        MIMIC,      \
			DOUBLE_DASH,  BIDE,       SWIFT,        SKULL_BASH, REST,       \
			PAY_DAY,      ROCK_SLIDE, TWIN_SLICE,     SUBSTITUTE,             \
			CUT,                                    STRENGTH

	; end

	db BANK(SandshrewPicFront)
	assert BANK(SandshrewPicFront) == BANK(SandshrewPicBack)
