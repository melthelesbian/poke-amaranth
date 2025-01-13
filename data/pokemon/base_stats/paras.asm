	db DEX_PARAS ; pokedex id

	db  35,  70,  55,  25,  55
	;   hp  atk  def  spd  spc

	db BUG, GRASS ; type
	db CR_EASY ; catch rate
	db EXP_YIELD_LOW ; base exp

	INCBIN "gfx/pokemon/front/paras.pic", 0, 1 ; sprite dimensions
	dw ParasPicFront, ParasPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, TOXIC,        RAZOR_LEAF, CRUNCH,     MEGA_DRAIN, \
			SOLARBEAM,    FOCUS_ENERGY, DIG,        MIMIC,      BIDE,       \
			BUG_BUZZ,     VENOM_STRIKE, REST,       ROCK_SLIDE, FURY_CUT,   \
			SUBSTITUTE,                                                     \
			CUT,                                    STRENGTH
	; end

	db BANK(ParasPicFront)
	assert BANK(ParasPicFront) == BANK(ParasPicBack)
