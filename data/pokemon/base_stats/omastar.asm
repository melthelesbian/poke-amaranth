	db DEX_OMASTAR ; pokedex id

	db  70,  60, 125,  55, 115
	;   hp  atk  def  spd  spc

	db WATER, ROCK ; type
	db CR_VERY_HARD ; catch rate
	db EXP_YIELD_VERY_HIGH ; base exp

	INCBIN "gfx/pokemon/front/omastar.pic", 0, 1 ; sprite dimensions
	dw OmastarPicFront, OmastarPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, TOXIC,       BUBBLEBEAM, ICE_BEAM,   HYPER_BEAM,   \
			LIGHT_SCREEN, REFLECT,     MEGA_DRAIN, WATERFALL,  DIG,          \
			MIMIC,        BIDE,        SLUDGE,     SKULL_BASH, VENOM_STRIKE, \
			REST,         HEAVY_SMASH, ROCK_SLIDE, SUBSTITUTE,               \
			                           SURF,       STRENGTH
	; end

	db BANK(OmastarPicFront)
	assert BANK(OmastarPicFront) == BANK(OmastarPicBack)
