	db DEX_FLAREON ; pokedex id

	db  65, 125,  60,  75, 125
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/flareon.pic", 0, 1 ; sprite dimensions
	dw FlareonPicFront, FlareonPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    TAKE_DOWN,    FLARE_RUSH,  HYPER_BEAM,   \
	     RAGE,         MIMIC,          REFLECT,      BIDE,         \
	     FIRE_BLAST,   SWIFT,        SKULL_BASH,   REST,         SUBSTITUTE
	; end

	db BANK(FlareonPicFront)
	assert BANK(FlareonPicFront) == BANK(FlareonPicBack)
