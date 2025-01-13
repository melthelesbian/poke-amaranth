	db DEX_MAROWAK ; pokedex id

	db  60,  90, 100,  45,  80
	;   hp  atk  def  spd  spc

	db GROUND, GHOST ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/marowak.pic", 0, 1 ; sprite dimensions
	dw MarowakPicFront, MarowakPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH, SWORDS_DANCE, HEADBUTT,     TELEPORT,    FIRE_PUNCH,  \
			ICE_PUNCH,  THUNDERPUNCH, DOUBLE_KICK,  HYPER_BEAM,  SUBMISSION,  \
			CRUNCH,     EARTHQUAKE,   FOCUS_ENERGY, DIG,         SHADOW_TEAR, \
			BIDE,       SKULL_BASH,   HYPNOSIS,     DREAM_EATER, REST,        \
			PAY_DAY,    ROCK_SLIDE,   SUBSTITUTE,   METRONOME,                \
			                                        STRENGTH
	; end

	db BANK(MarowakPicFront)
	assert BANK(MarowakPicFront) == BANK(MarowakPicBack)
