	db DEX_LICKITUNG ; pokedex id

	db  100,  70,  85,  40,  75
	;    hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/lickitung.pic", 0, 1 ; sprite dimensions
	dw LickitungPicFront, LickitungPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH,   HEADBUTT,    TOXIC,      DOUBLE_KICK,  HYPER_BEAM, \
			LIGHT_SCREEN, REFLECT,     CRUNCH,     FOCUS_ENERGY, DIG,        \
			MIMIC,        BIDE,        SLUDGE,     SKULL_BASH,   REST,       \
			MOONBLAST,    HEAVY_SMASH, ROCK_SLIDE, SUBSTITUTE,               \
			                                       STRENGTH
	; end

	db BANK(LickitungPicFront)
	assert BANK(LickitungPicFront) == BANK(LickitungPicBack)
