	db DEX_ODDISH ; pokedex id

	db  45,  50,  55,  30,  75
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db CR_TRIVIAL ; catch rate
	db EXP_YIELD_VERY_LOW ; base exp

	INCBIN "gfx/pokemon/front/oddish.pic", 0, 1 ; sprite dimensions
	dw OddishPicFront, OddishPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, HEADBUTT,   TOXIC,      RAZOR_LEAF,   LIGHT_SCREEN, \
			REFLECT,      MEGA_DRAIN, SOLARBEAM,  FOCUS_ENERGY, DIG,          \
			BIDE,         SLUDGE,     HYPNOSIS,   VENOM_STRIKE, REST,         \
			PAY_DAY,      TWIN_SLICE,   SUBSTITUTE,                             \
			CUT,                                  STRENGTH,     FLASH
	; end

	db BANK(OddishPicFront)
	assert BANK(OddishPicFront) == BANK(OddishPicBack)
