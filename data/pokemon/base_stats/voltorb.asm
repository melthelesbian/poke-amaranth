	db DEX_VOLTORB ; pokedex id

	db  40,  30,  50, 100,  55
	;   hp  atk  def  spd  spc

	db ELECTRIC, STEEL ; type
	db CR_EASY ; catch rate
	db EXP_YIELD_LOW ; base exp

	INCBIN "gfx/pokemon/front/voltorb.pic", 0, 1 ; sprite dimensions
	dw VoltorbPicFront, VoltorbPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	HEADBUTT,    TELEPORT,     THUNDER_WAVE, AGILITY,    SOLARBEAM,  \
			THUNDERBOLT, FOCUS_ENERGY, DOUBLE_DASH,  BIDE,       FLARE_RUSH, \
			SWIFT,       SKULL_BASH,   HEAVY_SMASH,  SUBSTITUTE,             \
			CUT,                                                 FLASH
	; end

	db BANK(VoltorbPicFront)
	assert BANK(VoltorbPicFront) == BANK(VoltorbPicBack)
