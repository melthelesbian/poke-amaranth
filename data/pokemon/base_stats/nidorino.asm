	db DEX_NIDORINO ; pokedex id

	db  60,  75,  65,  65,  55
	;   hp  atk  def  spd  spc

	db NORMAL, POISON ; type
	db CR_NORMAL ; catch rate
	db EXP_YIELD_NORMAL ; base exp

	INCBIN "gfx/pokemon/front/nidorino.pic", 0, 1 ; sprite dimensions
	dw NidorinoPicFront, NidorinoPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, HEADBUTT, TOXIC,       DOUBLE_KICK, CRUNCH,       \
			FOCUS_ENERGY, DIG,      BIDE,        SLUDGE,      VENOM_STRIKE, \
			REST,         PAY_DAY,  SUBSTITUTE,                             \
			                        SURF
	; end

	db BANK(NidorinoPicFront)
	assert BANK(NidorinoPicFront) == BANK(NidorinoPicBack)
