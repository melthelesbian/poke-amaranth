	db DEX_RAICHU ; pokedex id

	db  60,  90,  55, 110,  95
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/raichu.pic", 0, 1 ; sprite dimensions
	dw RaichuPicFront, RaichuPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH,   HEADBUTT,     THUNDERPUNCH, DOUBLE_KICK, THUNDER_WAVE, \
			HYPER_BEAM,   LIGHT_SCREEN, REFLECT,      AGILITY,     THUNDERBOLT,  \
			FOCUS_ENERGY, DIG,          PSYWAVE,      MIMIC,       DOUBLE_DASH,  \
			BIDE,         SWIFT,        SKULL_BASH,   REST,        PAY_DAY,      \
			HEAVY_SMASH,  SUBSTITUTE,                                            \
			                            SURF,         STRENGTH,    FLASH
	; end

	db BANK(RaichuPicFront)
	assert BANK(RaichuPicFront) == BANK(RaichuPicBack)
