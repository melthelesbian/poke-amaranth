	db DEX_VENONAT ; pokedex id

	db  60,  55,  50,  45,  55
	;   hp  atk  def  spd  spc

	db BUG, POISON ; type
	db CR_EASY ; catch rate
	db EXP_YIELD_VERY_LOW ; base exp

	INCBIN "gfx/pokemon/front/venonat.pic", 0, 1 ; sprite dimensions
	dw VenonatPicFront, VenonatPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, HEADBUTT,     TOXIC,       AGILITY,     CRUNCH,       \
			MEGA_DRAIN,   FOCUS_ENERGY, PSYCHIC_M,   PSYWAVE,     MIMIC,        \
			DOUBLE_DASH,  SHADOW_TEAR,  BIDE,        SLUDGE,      BUG_BUZZ,     \
			SWIFT,        SKULL_BASH,   HYPNOSIS,    DREAM_EATER, VENOM_STRIKE, \
			REST,         PAY_DAY,      HEAVY_SMASH, FURY_CUT,    SUBSTITUTE,   \
			CUT,                                                  FLASH
	; end

	db BANK(VenonatPicFront)
	assert BANK(VenonatPicFront) == BANK(VenonatPicBack)
