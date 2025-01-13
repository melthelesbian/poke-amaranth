	db DEX_CLOYSTER ; pokedex id

	db  50,  95, 180,  70,  85
	;   hp  atk  def  spd  spc

	db WATER, ICE ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/cloyster.pic", 0, 1 ; sprite dimensions
	dw CloysterPicFront, CloysterPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm	TOXIC,   BUBBLEBEAM, ICE_BEAM,  HYPER_BEAM,  LIGHT_SCREEN, \
			REFLECT, CRUNCH,     WATERFALL, MIMIC,       BIDE,         \
			SWIFT,   HYPNOSIS,   REST,      HEAVY_SMASH, ROCK_SLIDE,   \
			SUBSTITUTE,                                                \
			                     SURF,      STRENGTH
	; end

	db BANK(CloysterPicFront)
	assert BANK(CloysterPicFront) == BANK(CloysterPicBack)
