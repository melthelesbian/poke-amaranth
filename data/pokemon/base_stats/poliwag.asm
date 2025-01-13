	db DEX_POLIWAG ; pokedex id

	db  40,  50,  40,  90,  40
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db CR_TRIVIAL ; catch rate
	db EXP_YIELD_VERY_LOW ; base exp

	INCBIN "gfx/pokemon/front/poliwag.pic", 0, 1 ; sprite dimensions
	dw PoliwagPicFront, PoliwagPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, HEADBUTT,     BUBBLEBEAM, ICE_BEAM,    AGILITY,     \
			WATERFALL,    FOCUS_ENERGY, DIG,        MIMIC,       DOUBLE_DASH, \
			BIDE,         SWIFT,        HYPNOSIS,   DREAM_EATER, REST,        \
			HEAVY_SMASH,  SUBSTITUTE,                                         \
			                            SURF,                    FLASH
	; end

	db BANK(PoliwagPicFront)
	assert BANK(PoliwagPicFront) == BANK(PoliwagPicBack)
