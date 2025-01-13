	db DEX_POLIWRATH ; pokedex id

	db  90,  95,  95,  70,  90
	;   hp  atk  def  spd  spc

	db WATER, FIGHTING ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/poliwrath.pic", 0, 1 ; sprite dimensions
	dw PoliwrathPicFront, PoliwrathPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH,   SWORDS_DANCE, HEADBUTT,    ICE_PUNCH,   BUBBLEBEAM,  \
			ICE_BEAM,     HYPER_BEAM,   AGILITY,     SUBMISSION,  WATERFALL,   \
			FOCUS_ENERGY, DIG,          MIMIC,       DOUBLE_DASH, BIDE,        \
			SWIFT,        HYPNOSIS,     DREAM_EATER, REST,        HEAVY_SMASH, \
			SUBSTITUTE,                                                        \
			                            SURF,        STRENGTH,    FLASH
	; end

	db BANK(PoliwrathPicFront)
	assert BANK(PoliwrathPicFront) == BANK(PoliwrathPicBack)
