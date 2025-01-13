	db DEX_EKANS ; pokedex id

	db  35,  60,  45,  55,  50
	;   hp  atk  def  spd  spc

	db POISON, DARK ; type
	db CR_VERY_EASY ; catch rate
	db EXP_YIELD_VERY_LOW ; base exp

	INCBIN "gfx/pokemon/front/ekans.pic", 0, 1 ; sprite dimensions
	dw EkansPicFront, EkansPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm 	SWORDS_DANCE, HEADBUTT,   TOXIC,        AGILITY, CRUNCH,      \
			FOCUS_ENERGY, DIG,        SHADOW_TEAR,  BIDE,    SLUDGE,      \
			SWIFT,        SKULL_BASH, VENOM_STRIKE, REST,    HEAVY_SMASH, \
			SUBSTITUTE,                                                   \
			CUT,                                    STRENGTH
	; end

	db BANK(EkansPicFront)
	assert BANK(EkansPicFront) == BANK(EkansPicBack)
