	db DEX_SLOWBRO ; pokedex id

	db  95,  90, 110,  30, 100
	;   hp  atk  def  spd  spc

	db WATER, PSYCHIC_TYPE ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/slowbro.pic", 0, 1 ; sprite dimensions
	dw SlowbroPicFront, SlowbroPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH,   HEADBUTT,    BUBBLEBEAM, ICE_BEAM,     HYPER_BEAM, \
			LIGHT_SCREEN, REFLECT,     WATERFALL,  FOCUS_ENERGY, DIG,        \
			PSYCHIC_M,    PSYWAVE,     MIMIC,      BIDE,         SKULL_BASH, \
			HYPNOSIS,     DREAM_EATER, REST,       MOONBLAST,    PAY_DAY,    \
			HEAVY_SMASH,  ROCK_SLIDE,  SUBSTITUTE,                           \
			                           SURF,       STRENGTH,     FLASH
	; end

	db BANK(SlowbroPicFront)
	assert BANK(SlowbroPicFront) == BANK(SlowbroPicBack)
