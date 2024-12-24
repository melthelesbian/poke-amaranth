	db DEX_KRABBY ; pokedex id

	db  30, 105,  90,  50,  25
	;   hp  atk  def  spd  spc

	db WATER, STEEL ; type
	db CR_VERY_EASY ; catch rate
	db 115 ; base exp

	INCBIN "gfx/pokemon/front/krabby.pic", 0, 1 ; sprite dimensions
	dw KrabbyPicFront, KrabbyPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        BODY_SLAM,    TAKE_DOWN,      \
	     BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     RAGE,         \
	     MIMIC,          BIDE,         REST,         SUBSTITUTE,   \
	     CUT,          SURF,         STRENGTH
	; end

	db BANK(KrabbyPicFront)
	assert BANK(KrabbyPicFront) == BANK(KrabbyPicBack)
