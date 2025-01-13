	db DEX_ZAPDOS ; pokedex id

	db  90,  95,  85, 105, 125
	;   hp  atk  def  spd  spc

	db ELECTRIC, FLYING ; type
	db CR_CHALLENGING ; catch rate
	db EXP_YIELD_VERY_HIGH ; base exp

	INCBIN "gfx/pokemon/front/zapdos.pic", 0, 1 ; sprite dimensions
	dw ZapdosPicFront, ZapdosPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm	RAZOR_WIND,   SWORDS_DANCE, HEADBUTT,    THUNDER_WAVE, HYPER_BEAM,  \
			LIGHT_SCREEN, REFLECT,      AGILITY,     CRUNCH,       THUNDERBOLT, \
			FOCUS_ENERGY, MIMIC,        DOUBLE_DASH, BIDE,         SWIFT,       \
			SKULL_BASH,   REST,         HEAVY_SMASH, FURY_CUT,     SUBSTITUTE,  \
			              FLY,                       STRENGTH,     FLASH
	; end

	db BANK(ZapdosPicFront)
	assert BANK(ZapdosPicFront) == BANK(ZapdosPicBack)
