	db DEX_CUBONE ; pokedex id

	db  50,  50,  95,  35,  50
	;   hp  atk  def  spd  spc

	db GROUND, GHOST ; type
	db CR_EASY ; catch rate
	db EXP_YIELD_LOW ; base exp

	INCBIN "gfx/pokemon/front/cubone.pic", 0, 1 ; sprite dimensions
	dw CubonePicFront, CubonePicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH, SWORDS_DANCE, HEADBUTT,    TELEPORT,    FIRE_PUNCH, \
			ICE_PUNCH,  THUNDERPUNCH, DOUBLE_KICK, SUBMISSION,  CRUNCH,     \
			EARTHQUAKE, FOCUS_ENERGY, DIG,         SHADOW_TEAR, BIDE,       \
			SKULL_BASH, HYPNOSIS,     DREAM_EATER, REST,        PAY_DAY,    \
			ROCK_SLIDE, SUBSTITUTE,   METRONOME,                            \
			                                       STRENGTH
	; end

	db BANK(CubonePicFront)
	assert BANK(CubonePicFront) == BANK(CubonePicBack)
