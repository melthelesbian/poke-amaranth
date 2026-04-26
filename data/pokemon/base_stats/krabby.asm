	db DEX_KRABBY ; pokedex id

	db  30, 105,  90,  50,  25
	;   hp  atk  def  spd  spc

	db WATER, STEEL ; type
	db CR_VERY_EASY ; catch rate
	db EXP_YIELD_VERY_LOW ; base exp

	INCBIN "gfx/pokemon/front/krabby.pic", 0, 1 ; sprite dimensions
	dw KrabbyPicFront, KrabbyPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, ICE_PUNCH,    BUBBLEBEAM, ICE_BEAM,    CRUNCH,   \
			WATERFALL,    FOCUS_ENERGY, DIG,        MIMIC,       BIDE,     \
			SWIFT,        SKULL_BASH,   REST,       HEAVY_SMASH, TWIN_SLICE, \
			SUBSTITUTE,                                                    \
			CUT,                        SURF,       STRENGTH 
	; end

	db BANK(KrabbyPicFront)
	assert BANK(KrabbyPicFront) == BANK(KrabbyPicBack)
