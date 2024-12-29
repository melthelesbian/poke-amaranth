	db DEX_BULBASAUR ; pokedex id

	db  45,  50,  50,  45,  65
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db CR_NORMAL ; catch rate
	db EXP_YIELD_VERY_LOW ; base exp

	INCBIN "gfx/pokemon/front/bulbasaur.pic", 0, 1 ; sprite dimensions
	dw BulbasaurPicFront, BulbasaurPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        BODY_SLAM,    TAKE_DOWN,      \
	     RAGE,         MEGA_DRAIN,   SOLARBEAM,    MIMIC,          \
	     REFLECT,      BIDE,         REST,         SUBSTITUTE,   CUT
	; end

	db BANK(BulbasaurPicFront)
	assert BANK(BulbasaurPicFront) == BANK(BulbasaurPicBack)
