	db DEX_BLASTOISE ; pokedex id

	db  80,  90, 100,  60, 100
	;   hp  atk  def  spd  spc

	db WATER, STEEL ; type
	db CR_VERY_HARD ; catch rate
	db EXP_YIELD_VERY_HIGH ; base exp

	INCBIN "gfx/pokemon/front/blastoise.pic", 0, 1 ; sprite dimensions
	dw BlastoisePicFront, BlastoisePicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,  TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     EARTHQUAKE,   FISSURE,      DIG,          MIMIC,          \
	     REFLECT,      BIDE,         SKULL_BASH,   REST,         SUBSTITUTE,   \
	     SURF,         STRENGTH
	; end

	db BANK(BlastoisePicFront)
	assert BANK(BlastoisePicFront) == BANK(BlastoisePicBack)
