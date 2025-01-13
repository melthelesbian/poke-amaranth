	db DEX_NIDORINA ; pokedex id

	db  70,  65,  70,  60,  55
	;   hp  atk  def  spd  spc

	db NORMAL, GROUND ; type
	db CR_NORMAL ; catch rate
	db EXP_YIELD_NORMAL ; base exp

	INCBIN "gfx/pokemon/front/nidorina.pic", 0, 1 ; sprite dimensions
	dw NidorinaPicFront, NidorinaPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, HEADBUTT,    DOUBLE_KICK, EARTHQUAKE, FOCUS_ENERGY, \
			DIG,          DOUBLE_DASH, BIDE,        SWIFT,      REST,         \
			MOONBLAST,    ROCK_SLIDE,  SUBSTITUTE,                            \
			                           SURF
	; end

	db BANK(NidorinaPicFront)
	assert BANK(NidorinaPicFront) == BANK(NidorinaPicBack)
