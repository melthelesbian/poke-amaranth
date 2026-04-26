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
	tmhm	MEGA_PUNCH,   SWORDS_DANCE, HEADBUTT,   FIRE_PUNCH, ICE_PUNCH,   \
			THUNDERPUNCH, DOUBLE_KICK,  HYPER_BEAM, AGILITY,    SUBMISSION,  \
			CRUNCH,       EARTHQUAKE,   DIG,        MIMIC,      DOUBLE_DASH, \
			BIDE,         FLARE_RUSH,   SWIFT,      SKULL_BASH, PAY_DAY,     \
			HEAVY_SMASH,  ROCK_SLIDE,   TWIN_SLICE,   SUBSTITUTE,              \
			CUT,                                    STRENGTH
	; end

	db BANK(PrimeapePicFront)
	assert BANK(PrimeapePicFront) == BANK(PrimeapePicBack)
