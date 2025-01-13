	db DEX_SLOWPOKE ; pokedex id

	db  90,  65,  65,  15,  40
	;   hp  atk  def  spd  spc

	db WATER, NORMAL ; type
	db CR_EASY ; catch rate
	db EXP_YIELD_LOW ; base exp

	INCBIN "gfx/pokemon/front/slowpoke.pic", 0, 1 ; sprite dimensions
	dw SlowpokePicFront, SlowpokePicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH,  HEADBUTT,   BUBBLEBEAM,   ICE_BEAM,   LIGHT_SCREEN, \
			REFLECT,     WATERFALL,  FOCUS_ENERGY, DIG,        PSYCHIC_M,    \
			PSYWAVE,     MIMIC,      BIDE,         SKULL_BASH, HYPNOSIS,     \
			DREAM_EATER, REST,       MOONBLAST,    PAY_DAY,    HEAVY_SMASH,  \
			ROCK_SLIDE,  SUBSTITUTE,                                        \
			                         SURF,         STRENGTH,   FLASH
	; end

	db BANK(SlowpokePicFront)
	assert BANK(SlowpokePicFront) == BANK(SlowpokePicBack)
