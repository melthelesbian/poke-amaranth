	db DEX_POLIWRATH ; pokedex id

	db  90,  95,  95,  70,  90
	;   hp  atk  def  spd  spc

	db WATER, FIGHTING ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/poliwrath.pic", 0, 1 ; sprite dimensions
	dw PoliwrathPicFront, PoliwrathPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,       TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	       BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     EARTHQUAKE,   FISSURE,      PSYCHIC_M,    MIMIC,          \
	     BIDE,         METRONOME,    SKULL_BASH,   REST,         PSYWAVE,      \
	     SUBSTITUTE,   SURF,         STRENGTH
	; end

	db BANK(PoliwrathPicFront)
	assert BANK(PoliwrathPicFront) == BANK(PoliwrathPicBack)
