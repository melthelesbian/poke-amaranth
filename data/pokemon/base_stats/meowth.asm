	db DEX_MEOWTH ; pokedex id

	db  50,  45,  55,  90,  50
	;   hp  atk  def  spd  spc

	db DARK, DARK ; type
	db CR_TRIVIAL ; catch rate
	db EXP_YIELD_VERY_LOW ; base exp

	INCBIN "gfx/pokemon/front/meowth.pic", 0, 1 ; sprite dimensions
	dw MeowthPicFront, MeowthPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, HEADBUTT,     TOXIC,    DOUBLE_KICK, AGILITY,     \
			CRUNCH,       FOCUS_ENERGY, DIG,      MIMIC,       DOUBLE_DASH, \
			SHADOW_TEAR,  BIDE,         SWIFT,    SKULL_BASH,  HYPNOSIS,    \
			REST,         PAY_DAY,      FURY_CUT, SUBSTITUTE,               \
			CUT,                                               FLASH
	; end

	db BANK(MeowthPicFront)
	assert BANK(MeowthPicFront) == BANK(MeowthPicBack)
