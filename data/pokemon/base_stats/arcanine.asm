	db DEX_ARCANINE ; pokedex id

	db  95, 115,  80,  95, 100
	;   hp  atk  def  spd  spc

	db FIRE, DARK ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/arcanine.pic", 0, 1 ; sprite dimensions
	dw ArcaninePicFront, ArcaninePicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    FLARE_RUSH,  HYPER_BEAM,   \
	     RAGE,         DRAGON_RAGE,  DIG,          TELEPORT,     MIMIC,        \
	       REFLECT,      BIDE,         FIRE_BLAST,   SWIFT,        \
	     SKULL_BASH,   REST,         SUBSTITUTE
	; end

	db BANK(ArcaninePicFront)
	assert BANK(ArcaninePicFront) == BANK(ArcaninePicBack)
