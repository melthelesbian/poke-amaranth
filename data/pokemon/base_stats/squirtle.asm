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
	tmhm MEGA_PUNCH,       TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	       BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     \
	     SUBMISSION,   COUNTER,      SEISMIC_TOSS, RAGE,         DIG,          \
	     MIMIC,          REFLECT,      BIDE,         SKULL_BASH,   \
	     REST,         SUBSTITUTE,   SURF,         STRENGTH
	; end

	db BANK(SquirtlePicFront)
	assert BANK(SquirtlePicFront) == BANK(SquirtlePicBack)
