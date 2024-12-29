	db DEX_GENGAR ; pokedex id

	db  60,  65,  60, 115, 125
	;   hp  atk  def  spd  spc

	db GHOST, DARK ; type
	db CR_VERY_HARD ; catch rate
	db EXP_YIELD_VERY_HIGH ; base exp

	INCBIN "gfx/pokemon/front/gengar.pic", 0, 1 ; sprite dimensions
	dw GengarPicFront, GengarPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,       TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	       HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     RAGE,         MEGA_DRAIN,   THUNDERBOLT,  THUNDER,      PSYCHIC_M,    \
	     MIMIC,          BIDE,         METRONOME,    SELFDESTRUCT, \
	     SKULL_BASH,   DREAM_EATER,  REST,         PSYWAVE,      EXPLOSION,    \
	     SUBSTITUTE,   STRENGTH
	; end

	db BANK(GengarPicFront)
	assert BANK(GengarPicFront) == BANK(GengarPicBack)
