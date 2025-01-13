	db DEX_SQUIRTLE ; pokedex id

	db  45,  45,  65,  45,  55
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db CR_NORMAL ; catch rate
	db EXP_YIELD_VERY_LOW ; base exp

	INCBIN "gfx/pokemon/front/squirtle.pic", 0, 1 ; sprite dimensions
	dw SquirtlePicFront, SquirtlePicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH, HEADBUTT,     FIRE_PUNCH, ICE_PUNCH, THUNDERPUNCH, \
			BUBBLEBEAM, ICE_BEAM,     SUBMISSION, CRUNCH,    WATERFALL,    \
			EARTHQUAKE, FOCUS_ENERGY, DIG,        BIDE,      SKULL_BASH,   \
			REST,       SUBSTITUTE,                                        \
			CUT,                      SURF,       STRENGTH
	; end

	db BANK(SquirtlePicFront)
	assert BANK(SquirtlePicFront) == BANK(SquirtlePicBack)
