	db DEX_PONYTA ; pokedex id

	db  50,  85,  55,  90,  65
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db CR_EASY ; catch rate
	db EXP_YIELD_LOW ; base exp

	INCBIN "gfx/pokemon/front/ponyta.pic", 0, 1 ; sprite dimensions
	dw PonytaPicFront, PonytaPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	HEADBUTT,     DOUBLE_KICK, AGILITY, CRUNCH,       EARTHQUAKE, \
			FOCUS_ENERGY, DOUBLE_DASH, BIDE,    FLAMETHROWER, FLARE_RUSH, \
			SWIFT,        SKULL_BASH,  REST,    HEAVY_SMASH,  ROCK_SLIDE, \
			SUBSTITUTE,                                                   \
			                                    STRENGTH,     FLASH
	; end

	db BANK(PonytaPicFront)
	assert BANK(PonytaPicFront) == BANK(PonytaPicBack)
