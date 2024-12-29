	db DEX_SEAKING ; pokedex id

	db  80,  95,  65,  70,  80
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/seaking.pic", 0, 1 ; sprite dimensions
	dw SeakingPicFront, SeakingPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,           TAKE_DOWN,      BUBBLEBEAM,   \
	     WATER_GUN,    ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   RAGE,         \
	     MIMIC,          BIDE,         SWIFT,        SKULL_BASH,   \
	     REST,         SUBSTITUTE,   SURF
	; end

	db BANK(SeakingPicFront)
	assert BANK(SeakingPicFront) == BANK(SeakingPicBack)
