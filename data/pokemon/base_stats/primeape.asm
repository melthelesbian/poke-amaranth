	db DEX_PRIMEAPE ; pokedex id

	db  65, 105,  60,  95,  70
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/primeape.pic", 0, 1 ; sprite dimensions
	dw PrimeapePicFront, PrimeapePicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,       TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	       HYPER_BEAM,   PAY_DAY,      SUBMISSION,   COUNTER,      \
	     SEISMIC_TOSS, RAGE,         THUNDERBOLT,  THUNDER,      DIG,          \
	     MIMIC,          BIDE,         METRONOME,    SWIFT,        \
	     SKULL_BASH,   REST,         ROCK_SLIDE,   SUBSTITUTE,   STRENGTH
	; end

	db BANK(PrimeapePicFront)
	assert BANK(PrimeapePicFront) == BANK(PrimeapePicBack)
