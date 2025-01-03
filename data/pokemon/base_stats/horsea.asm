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
	tmhm TOXIC,        TAKE_DOWN,      BUBBLEBEAM,   WATER_GUN,    \
	     ICE_BEAM,     BLIZZARD,     RAGE,         MIMIC,          \
	     BIDE,         SWIFT,        SKULL_BASH,   REST,         SUBSTITUTE,   \
	     SURF
	; end

	db BANK(HorseaPicFront)
	assert BANK(HorseaPicFront) == BANK(HorseaPicBack)
