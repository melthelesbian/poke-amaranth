	db DEX_PERSIAN ; pokedex id

	db  65,  70,  60, 115,  75
	;   hp  atk  def  spd  spc

	db DARK, DARK ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/persian.pic", 0, 1 ; sprite dimensions
	dw PersianPicFront, PersianPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, HEADBUTT,    TOXIC,        DOUBLE_KICK, HYPER_BEAM, \
			AGILITY,      CRUNCH,      FOCUS_ENERGY, DIG,         MIMIC, \
			DOUBLE_DASH,  SHADOW_TEAR, BIDE,         SWIFT,       SKULL_BASH, \
			HYPNOSIS,     REST,        PAY_DAY,      FURY_CUT,    SUBSTITUTE, \
			CUT,                                                  FLASH
	; end

	db BANK(PersianPicFront)
	assert BANK(PersianPicFront) == BANK(PersianPicBack)
