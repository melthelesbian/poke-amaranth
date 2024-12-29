	db DEX_ONIX ; pokedex id

	db  50,  65, 175,  50,  60
	;   hp  atk  def  spd  spc

	db ROCK, ROCK ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/onix.pic", 0, 1 ; sprite dimensions
	dw OnixPicFront, OnixPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,      RAGE,         \
	     EARTHQUAKE,   FISSURE,      DIG,          MIMIC,          \
	     BIDE,         SELFDESTRUCT, SKULL_BASH,   REST,         EXPLOSION,    \
	     ROCK_SLIDE,   SUBSTITUTE,   STRENGTH
	; end

	db BANK(OnixPicFront)
	assert BANK(OnixPicFront) == BANK(OnixPicBack)
