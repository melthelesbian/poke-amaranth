	db DEX_KANGASKHAN ; pokedex id

	db 105, 110,  90,  95,  80
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/kangaskhan.pic", 0, 1 ; sprite dimensions
	dw KangaskhanPicFront, KangaskhanPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH,   SWORDS_DANCE, HEADBUTT,    FIRE_PUNCH,  ICE_PUNCH,    \
			THUNDERPUNCH, HYPER_BEAM,   SUBMISSION,  CRUNCH,      DRAGONBREATH, \
			EARTHQUAKE,   DIG,          MIMIC,       DOUBLE_DASH, BIDE,         \
			SKULL_BASH,   REST,         HEAVY_SMASH, SUBSTITUTE,                \
			                            SURF,        STRENGTH
	; end

	db BANK(KangaskhanPicFront)
	assert BANK(KangaskhanPicFront) == BANK(KangaskhanPicBack)
