	db DEX_PIKACHU ; pokedex id

	db  35,  55,  40,  90,  50
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db CR_EASY ; catch rate
	db EXP_YIELD_LOW ; base exp

	INCBIN "gfx/pokemon/front/pikachu.pic", 0, 1 ; sprite dimensions
	dw PikachuPicFront, PikachuPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH,   HEADBUTT, THUNDERPUNCH, DOUBLE_KICK, THUNDER_WAVE, \
			LIGHT_SCREEN, REFLECT,  AGILITY,      THUNDERBOLT, FOCUS_ENERGY, \
			DIG,          MIMIC,    DOUBLE_DASH,  BIDE,        SWIFT,        \
			SKULL_BASH,   REST,     PAY_DAY,      SUBSTITUTE,                \
			              FLY,      SURF,                      FLASH
	; end

	db BANK(PikachuPicFront)
	assert BANK(PikachuPicFront) == BANK(PikachuPicBack)
