	db DEX_ZUBAT ; pokedex id

	db  40,  45,  35,  55,  40
	;   hp  atk  def  spd  spc

	db POISON, FLYING ; type
	db CR_TRIVIAL ; catch rate
	db EXP_YIELD_VERY_LOW ; base exp

	INCBIN "gfx/pokemon/front/zubat.pic", 0, 1 ; sprite dimensions
	dw ZubatPicFront, ZubatPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	RAZOR_WIND, SWORDS_DANCE, HEADBUTT,   TOXIC,       AGILITY,      \
			CRUNCH,     FOCUS_ENERGY, MIMIC,      DOUBLE_DASH, BIDE,         \
			SLUDGE,     SWIFT,        SKULL_BASH, HYPNOSIS,    VENOM_STRIKE, \
			REST,       PAY_DAY,      FURY_CUT,   SUBSTITUTE,                \
			CUT,        FLY,                                   FLASH
	; end

	db BANK(ZubatPicFront)
	assert BANK(ZubatPicFront) == BANK(ZubatPicBack)
