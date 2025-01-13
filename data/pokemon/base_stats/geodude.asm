	db DEX_GEODUDE ; pokedex id

	db  40,  80, 100,  20,  30
	;   hp  atk  def  spd  spc

	db ROCK, GROUND ; type
	db CR_TRIVIAL ; catch rate
	db EXP_YIELD_VERY_LOW ; base exp

	INCBIN "gfx/pokemon/front/geodude.pic", 0, 1 ; sprite dimensions
	dw GeodudePicFront, GeodudePicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH, HEADBUTT,   FIRE_PUNCH, ICE_PUNCH,   THUNDERPUNCH, \
			SUBMISSION, CRUNCH,     EARTHQUAKE, DIG,         MIMIC,        \
			BIDE,       SKULL_BASH, REST,       HEAVY_SMASH, ROCK_SLIDE,   \
			SUBSTITUTE,                                                    \
			STRENGTH
	; end

	db BANK(GeodudePicFront)
	assert BANK(GeodudePicFront) == BANK(GeodudePicBack)
