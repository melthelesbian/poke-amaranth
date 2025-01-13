	db DEX_RATTATA ; pokedex id

	db  30,  55,  35,  75,  25
	;   hp  atk  def  spd  spc

	db NORMAL, DARK ; type
	db CR_TRIVIAL ; catch rate
	db EXP_YIELD_VERY_LOW ; base exp

	INCBIN "gfx/pokemon/front/rattata.pic", 0, 1 ; sprite dimensions
	dw RattataPicFront, RattataPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, HEADBUTT,     TOXIC,   DOUBLE_KICK, AGILITY, \
			CRUNCH,       FOCUS_ENERGY, DIG,     MIMIC,       BIDE,    \
			SKULL_BASH,   REST,         PAY_DAY, SUBSTITUTE,           \
			CUT,                                 STRENGTH
	; end

	db BANK(RattataPicFront)
	assert BANK(RattataPicFront) == BANK(RattataPicBack)
