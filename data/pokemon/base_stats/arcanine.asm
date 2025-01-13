	db DEX_ARCANINE ; pokedex id

	db  95, 115,  80,  95, 100
	;   hp  atk  def  spd  spc

	db FIRE, DARK ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/arcanine.pic", 0, 1 ; sprite dimensions
	dw ArcaninePicFront, ArcaninePicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm	HEADBUTT, DOUBLE_KICK, AGILITY, CRUNCH,       FOCUS_ENERGY, \
			DIG,      DOUBLE_DASH, BIDE,    FLAMETHROWER, FLARE_RUSH,   \
			SWIFT,    SKULL_BASH,  REST,    HEAVY_SMASH,  SUBSTITUTE,   \
			                                STRENGTH
	; end

	db BANK(ArcaninePicFront)
	assert BANK(ArcaninePicFront) == BANK(ArcaninePicBack)
