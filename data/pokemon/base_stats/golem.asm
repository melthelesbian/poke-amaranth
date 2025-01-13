	db DEX_GOLEM ; pokedex id

	db  80, 120, 130,  45,  65
	;   hp  atk  def  spd  spc

	db ROCK, GROUND ; type
	db CR_VERY_HARD ; catch rate
	db EXP_YIELD_VERY_HIGH ; base exp

	INCBIN "gfx/pokemon/front/golem.pic", 0, 1 ; sprite dimensions
	dw GolemPicFront, GolemPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm 	MEGA_PUNCH, HEADBUTT,   FIRE_PUNCH, ICE_PUNCH,  THUNDERPUNCH, \
			HYPER_BEAM, SUBMISSION, CRUNCH,     EARTHQUAKE, DIG,          \
			MIMIC,      BIDE,       SKULL_BASH, REST,       HEAVY_SMASH,  \
			ROCK_SLIDE, SUBSTITUTE,                                       \
			                                    STRENGTH
	; end

	db BANK(GolemPicFront)
	assert BANK(GolemPicFront) == BANK(GolemPicBack)
