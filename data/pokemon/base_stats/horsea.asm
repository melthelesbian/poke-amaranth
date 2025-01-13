	db DEX_HORSEA ; pokedex id

	db  30,  40,  70,  60,  70
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db CR_VERY_EASY ; catch rate
	db EXP_YIELD_VERY_LOW ; base exp

	INCBIN "gfx/pokemon/front/horsea.pic", 0, 1 ; sprite dimensions
	dw HorseaPicFront, HorseaPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	HEADBUTT,     TOXIC,        BUBBLEBEAM,  ICE_BEAM,     THUNDER_WAVE, \
			LIGHT_SCREEN, REFLECT,      AGILITY,     DRAGONBREATH, WATERFALL,    \
			FOCUS_ENERGY, MIMIC,        DOUBLE_DASH, BIDE,         SLUDGE,       \
			SWIFT,        VENOM_STRIKE, REST,        MOONBLAST,    SUBSTITUTE,   \
			                            SURF,                      FLASH
	; end

	db BANK(HorseaPicFront)
	assert BANK(HorseaPicFront) == BANK(HorseaPicBack)
