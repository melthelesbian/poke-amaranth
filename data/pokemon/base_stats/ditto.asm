	db DEX_DITTO ; pokedex id

	db  75,  75,  75,  75,  75
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/ditto.pic", 0, 1 ; sprite dimensions
	dw DittoPicFront, DittoPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm
	; end

	db BANK(DittoPicFront)
	assert BANK(DittoPicFront) == BANK(DittoPicBack)
