	db DEX_VENOMOTH ; pokedex id

	db  70,  90,  60,  90,  90
	;   hp  atk  def  spd  spc

	db BUG, FLYING ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/venomoth.pic", 0, 1 ; sprite dimensions
	dw VenomothPicFront, VenomothPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	RAZOR_WIND,   SWORDS_DANCE, HEADBUTT,     TOXIC,        HYPER_BEAM,  \
			AGILITY,      CRUNCH,       MEGA_DRAIN,   FOCUS_ENERGY, PSYCHIC_M,   \
			PSYWAVE,      MIMIC,        DOUBLE_DASH,  SHADOW_TEAR,  BIDE,        \
			SLUDGE,       BUG_BUZZ,     SWIFT,        SKULL_BASH,   HYPNOSIS,    \
			DREAM_EATER,  VENOM_STRIKE, REST,         PAY_DAY,      HEAVY_SMASH, \
			FURY_CUT,     SUBSTITUTE,                                            \
			CUT,          FLY,                                     FLASH
	; end

	db BANK(VenomothPicFront)
	assert BANK(VenomothPicFront) == BANK(VenomothPicBack)
