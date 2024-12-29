	db DEX_VILEPLUME ; pokedex id

	db  75,  95,  95,  50, 110
	;   hp  atk  def  spd  spc

	db GRASS, DARK ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/vileplume.pic", 0, 1 ; sprite dimensions
	dw VileplumePicFront, VileplumePicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        BODY_SLAM,    TAKE_DOWN,      \
	     HYPER_BEAM,   RAGE,         MEGA_DRAIN,   SOLARBEAM,    MIMIC,        \
	       REFLECT,      BIDE,         REST,         SUBSTITUTE,   \
	     CUT
	; end

	db BANK(VileplumePicFront)
	assert BANK(VileplumePicFront) == BANK(VileplumePicBack)
