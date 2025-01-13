	db DEX_GROWLITHE ; pokedex id

	db  55,  70,  45,  60,  70
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db CR_EASY ; catch rate
	db EXP_YIELD_LOW ; base exp

	INCBIN "gfx/pokemon/front/growlithe.pic", 0, 1 ; sprite dimensions
	dw GrowlithePicFront, GrowlithePicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm	HEADBUTT, DOUBLE_KICK, AGILITY, CRUNCH,       FOCUS_ENERGY, \
			DIG,      DOUBLE_DASH, BIDE,    FLAMETHROWER, FLARE_RUSH,   \
			SWIFT,    SKULL_BASH,  REST,    HEAVY_SMASH,  SUBSTITUTE,   \
			STRENGTH
	; end

	db BANK(GrowlithePicFront)
	assert BANK(GrowlithePicFront) == BANK(GrowlithePicBack)
