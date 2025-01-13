	db DEX_DIGLETT ; pokedex id

	db  10,  55,  30,  95,  45
	;   hp  atk  def  spd  spc

	db GROUND, GROUND ; type
	db CR_VERY_EASY ; catch rate
	db EXP_YIELD_VERY_LOW ; base exp

	INCBIN "gfx/pokemon/front/diglett.pic", 0, 1 ; sprite dimensions
	dw DiglettPicFront, DiglettPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, HEADBUTT,   TELEPORT,    AGILITY,    EARTHQUAKE, \
			FOCUS_ENERGY, DIG,        DOUBLE_DASH, BIDE,       SWIFT,      \
			SKULL_BASH,   ROCK_SLIDE, FURY_CUT,    SUBSTITUTE,             \
			CUT,                                   STRENGTH
	; end

	db BANK(DiglettPicFront)
	assert BANK(DiglettPicFront) == BANK(DiglettPicBack)
