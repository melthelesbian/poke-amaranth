	db DEX_POLIWHIRL ; pokedex id

	db  65,  65,  65,  90,  50
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db CR_NORMAL ; catch rate
	db EXP_YIELD_NORMAL ; base exp

	INCBIN "gfx/pokemon/front/poliwhirl.pic", 0, 1 ; sprite dimensions
	dw PoliwhirlPicFront, PoliwhirlPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH, SWORDS_DANCE, HEADBUTT,    ICE_PUNCH,   BUBBLEBEAM,   \
			ICE_BEAM,   AGILITY,      SUBMISSION,  WATERFALL,   FOCUS_ENERGY, \
			DIG,        MIMIC,        DOUBLE_DASH, BIDE,        SWIFT,        \
			HYPNOSIS,   DREAM_EATER,  REST,        HEAVY_SMASH, SUBSTITUTE,   \
			                          SURF,        STRENGTH,    FLASH
	; end

	db BANK(PoliwhirlPicFront)
	assert BANK(PoliwhirlPicFront) == BANK(PoliwhirlPicBack)
