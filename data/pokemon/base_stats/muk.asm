	db DEX_MUK ; pokedex id

	db 105, 105,  75,  50, 100
	;   hp  atk  def  spd  spc

	db POISON, POISON ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/muk.pic", 0, 1 ; sprite dimensions
	dw MukPicFront, MukPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BODY_SLAM,    HYPER_BEAM,   RAGE,         MEGA_DRAIN,   \
	     THUNDERBOLT,  THUNDER,      MIMIC,          BIDE,         \
	     SELFDESTRUCT, FIRE_BLAST,   REST,         EXPLOSION,    SUBSTITUTE
	; end

	db BANK(MukPicFront)
	assert BANK(MukPicFront) == BANK(MukPicBack)
