	db DEX_GYARADOS ; pokedex id

	db  95, 125,  80,  80, 100
	;   hp  atk  def  spd  spc

	db WATER, DRAGON ; type
	db CR_VERY_HARD ; catch rate
	db EXP_YIELD_VERY_HIGH ; base exp

	INCBIN "gfx/pokemon/front/gyarados.pic", 0, 1 ; sprite dimensions
	dw GyaradosPicFront, GyaradosPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm	RAZOR_WIND, SWORDS_DANCE, HEADBUTT,    BUBBLEBEAM,  ICE_BEAM,     \
			HYPER_BEAM, AGILITY,      SUBMISSION,  CRUNCH,      DRAGONBREATH, \
			WATERFALL,  FOCUS_ENERGY, MIMIC,       DOUBLE_DASH, BIDE,         \
			SWIFT,      SKULL_BASH,   HEAVY_SMASH, SUBSTITUTE,                \
			            FLY,          SURF,        STRENGTH,    FLASH
	; end

	db BANK(GyaradosPicFront)
	assert BANK(GyaradosPicFront) == BANK(GyaradosPicBack)
