	db DEX_GOLDEEN ; pokedex id

	db  45,  70,  60,  65,  50
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db CR_VERY_EASY ; catch rate
	db EXP_YIELD_VERY_LOW ; base exp

	INCBIN "gfx/pokemon/front/goldeen.pic", 0, 1 ; sprite dimensions
	dw GoldeenPicFront, GoldeenPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	HEADBUTT,    BUBBLEBEAM,  ICE_BEAM,   THUNDER_WAVE, AGILITY,     \
			CRUNCH,      THUNDERBOLT, WATERFALL,  FOCUS_ENERGY, MIMIC,       \
			DOUBLE_DASH, SWIFT,       SKULL_BASH, REST,         HEAVY_SMASH, \
			SUBSTITUTE,                                                      \
			                          SURF,                     FLASH
	; end

	db BANK(GoldeenPicFront)
	assert BANK(GoldeenPicFront) == BANK(GoldeenPicBack)
