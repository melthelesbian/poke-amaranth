	db DEX_GOLBAT ; pokedex id

	db  80,  85,  75, 105,  75
	;   hp  atk  def  spd  spc

	db POISON, FLYING ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/golbat.pic", 0, 1 ; sprite dimensions
	dw GolbatPicFront, GolbatPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	RAZOR_WIND,   SWORDS_DANCE, HEADBUTT,     TOXIC,      HYPER_BEAM,  \
			AGILITY,      CRUNCH,       FOCUS_ENERGY, MIMIC,      DOUBLE_DASH, \
			BIDE,         SLUDGE,       SWIFT,        SKULL_BASH, HYPNOSIS,    \
			VENOM_STRIKE, REST,         PAY_DAY,      TWIN_SLICE,   SUBSTITUTE,  \
			CUT,          FLY,                                    FLASH
	; end

	db BANK(GolbatPicFront)
	assert BANK(GolbatPicFront) == BANK(GolbatPicBack)
