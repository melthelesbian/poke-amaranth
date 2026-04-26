	db DEX_SCYTHER ; pokedex id

	db  70, 120,  90, 105,  80
	;   hp  atk  def  spd  spc

	db BUG, DARK ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/scyther.pic", 0, 1 ; sprite dimensions
	dw ScytherPicFront, ScytherPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, TOXIC,        RAZOR_LEAF, HYPER_BEAM,   AGILITY, \
			CRUNCH,       FOCUS_ENERGY, MIMIC,      DOUBLE_DASH,  BIDE,    \
			BUG_BUZZ,     SWIFT,        SKULL_BASH, VENOM_STRIKE, REST,    \
			HEAVY_SMASH,  TWIN_SLICE,     SUBSTITUTE,                        \
			CUT,          FLY,                      STRENGTH
	; end

	db BANK(ScytherPicFront)
	assert BANK(ScytherPicFront) == BANK(ScytherPicBack)
