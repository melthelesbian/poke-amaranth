	db DEX_MAGMAR ; pokedex id

	db  70,  95,  70,  95, 100
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/magmar.pic", 0, 1 ; sprite dimensions
	dw MagmarPicFront, MagmarPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,       TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	     FLARE_RUSH,  HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     RAGE,         PSYCHIC_M,    TELEPORT,     MIMIC,          \
	     BIDE,         METRONOME,    FIRE_BLAST,   SKULL_BASH,   REST,         \
	     PSYWAVE,      SUBSTITUTE,   STRENGTH
	; end

	db BANK(MagmarPicFront)
	assert BANK(MagmarPicFront) == BANK(MagmarPicBack)
