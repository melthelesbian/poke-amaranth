	db DEX_ARBOK ; pokedex id

	db  60,  95,  70,  80,  75
	;   hp  atk  def  spd  spc

	db POISON, DARK ; type
	db CR_NORMAL ; catch rate
	db EXP_YIELD_NORMAL ; base exp

	INCBIN "gfx/pokemon/front/arbok.pic", 0, 1 ; sprite dimensions
	dw ArbokPicFront, ArbokPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, HEADBUTT,   TOXIC,        AGILITY, CRUNCH,      \
			FOCUS_ENERGY, DIG,        SHADOW_TEAR,  BIDE,    SLUDGE,      \
			SWIFT,        SKULL_BASH, VENOM_STRIKE, REST,    HEAVY_SMASH, \
			SUBSTITUTE,                                                    \
			CUT,                                    STRENGTH
	; end

	db BANK(ArbokPicFront)
	assert BANK(ArbokPicFront) == BANK(ArbokPicBack)
