	db DEX_SHELLDER ; pokedex id

	db  30,  65, 100,  40,  45
	;   hp  atk  def  spd  spc

	db WATER, ICE ; type
	db CR_EASY ; catch rate
	db EXP_YIELD_LOW ; base exp

	INCBIN "gfx/pokemon/front/shellder.pic", 0, 1 ; sprite dimensions
	dw ShellderPicFront, ShellderPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm	TOXIC,    BUBBLEBEAM, ICE_BEAM,    LIGHT_SCREEN, REFLECT,    \
			CRUNCH,   WATERFALL,  MIMIC,       BIDE,         SWIFT,      \
			HYPNOSIS, REST,       HEAVY_SMASH, ROCK_SLIDE,   SUBSTITUTE, \
			                      SURF,        STRENGTH
	; end

	db BANK(ShellderPicFront)
	assert BANK(ShellderPicFront) == BANK(ShellderPicBack)
