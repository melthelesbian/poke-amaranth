	db DEX_OMANYTE ; pokedex id

	db  35,  40, 100,  35,  90
	;   hp  atk  def  spd  spc

	db WATER, ROCK ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/omanyte.pic", 0, 1 ; sprite dimensions
	dw OmanytePicFront, OmanytePicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, TOXIC,      BUBBLEBEAM, ICE_BEAM,     LIGHT_SCREEN, \
			REFLECT,      MEGA_DRAIN, WATERFALL,  DIG,          MIMIC,        \
			BIDE,         SLUDGE,     SKULL_BASH, VENOM_STRIKE, REST,         \
			HEAVY_SMASH,  ROCK_SLIDE, SUBSTITUTE,                             \
			                          SURF,       STRENGTH
	; end

	db BANK(OmanytePicFront)
	assert BANK(OmanytePicFront) == BANK(OmanytePicBack)
