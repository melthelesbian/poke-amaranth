	db DEX_MACHOKE ; pokedex id

	db  80, 100,  70,  45,  60
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/machoke.pic", 0, 1 ; sprite dimensions
	dw MachokePicFront, MachokePicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,       TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	       SUBMISSION,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     EARTHQUAKE,   FISSURE,      DIG,          MIMIC,          \
	     BIDE,         METRONOME,    FIRE_BLAST,   SKULL_BASH,   REST,         \
	     ROCK_SLIDE,   SUBSTITUTE,   STRENGTH
	; end

	db BANK(MachokePicFront)
	assert BANK(MachokePicFront) == BANK(MachokePicBack)
