	db DEX_METAPOD ; pokedex id

	db  50,  20,  55,  30,  25
	;   hp  atk  def  spd  spc

	db BUG, BUG ; type
	db CR_EASY ; catch rate
	db EXP_YIELD_LOW ; base exp

	INCBIN "gfx/pokemon/front/metapod.pic", 0, 1 ; sprite dimensions
	dw MetapodPicFront, MetapodPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm
	; end

	db BANK(MetapodPicFront)
	assert BANK(MetapodPicFront) == BANK(MetapodPicBack)
