	db DEX_WARTORTLE ; pokedex id

	db  55,  65,  80,  55,  70
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/wartortle.pic", 0, 1 ; sprite dimensions
	dw WartortlePicFront, WartortlePicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH, HEADBUTT,     FIRE_PUNCH, ICE_PUNCH, THUNDERPUNCH, \
			BUBBLEBEAM, ICE_BEAM,     SUBMISSION, CRUNCH,    WATERFALL,    \
			EARTHQUAKE, FOCUS_ENERGY, DIG,        BIDE,      SKULL_BASH,   \
			REST,       HEAVY_SMASH,  SUBSTITUTE,                          \
			CUT,                      SURF,       STRENGTH
	; end

	db BANK(WartortlePicFront)
	assert BANK(WartortlePicFront) == BANK(WartortlePicBack)
