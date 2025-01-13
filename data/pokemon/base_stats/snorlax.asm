	db DEX_SNORLAX ; pokedex id

	db 160, 110,  65,  30,  90
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db CR_VERY_HARD ; catch rate
	db EXP_YIELD_VERY_HIGH ; base exp

	INCBIN "gfx/pokemon/front/snorlax.pic", 0, 1 ; sprite dimensions
	dw SnorlaxPicFront, SnorlaxPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH, HEADBUTT,    FIRE_PUNCH, ICE_PUNCH,  THUNDERPUNCH, \
			BUBBLEBEAM, HYPER_BEAM,  SUBMISSION, CRUNCH,     EARTHQUAKE,   \
			DIG,        MIMIC,       BIDE,       SKULL_BASH, REST,         \
			PAY_DAY,    HEAVY_SMASH, SUBSTITUTE,                           \
			SURF,       STRENGTH
	; end

	db BANK(SnorlaxPicFront)
	assert BANK(SnorlaxPicFront) == BANK(SnorlaxPicBack)
