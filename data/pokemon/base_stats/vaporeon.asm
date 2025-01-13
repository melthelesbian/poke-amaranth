	db DEX_VAPOREON ; pokedex id

	db  125,  60,  65,  75, 125
	;    hp  atk  def  spd  spc

	db WATER, WATER ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/vaporeon.pic", 0, 1 ; sprite dimensions
	dw VaporeonPicFront, VaporeonPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm 	SWORDS_DANCE, HEADBUTT,   TOXIC,        BUBBLEBEAM, DOUBLE_KICK, \
			ICE_BEAM,     HYPER_BEAM, LIGHT_SCREEN, REFLECT,    AGILITY,     \
			CRUNCH,       WATERFALL,  FOCUS_ENERGY, DIG,        MIMIC,       \
			DOUBLE_DASH,  BIDE,       SWIFT,        SKULL_BASH, REST,        \
			SUBSTITUTE,                                                      \
			                          SURF,         STRENGTH,   FLASH
	; end

	db BANK(VaporeonPicFront)
	assert BANK(VaporeonPicFront) == BANK(VaporeonPicBack)
