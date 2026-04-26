	db DEX_PARASECT ; pokedex id

	db  60,  95,  80,  30,  85
	;   hp  atk  def  spd  spc

	db BUG, GRASS ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/parasect.pic", 0, 1 ; sprite dimensions
	dw ParasectPicFront, ParasectPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, TOXIC,      RAZOR_LEAF,   HYPER_BEAM, CRUNCH,     \
			MEGA_DRAIN,   SOLARBEAM,  FOCUS_ENERGY, DIG,        MIMIC,      \
			BIDE,         BUG_BUZZ,   VENOM_STRIKE, REST,       ROCK_SLIDE, \
			TWIN_SLICE,     SUBSTITUTE,                                       \
			CUT,                                    STRENGTH
	; end

	db BANK(ParasectPicFront)
	assert BANK(ParasectPicFront) == BANK(ParasectPicBack)
