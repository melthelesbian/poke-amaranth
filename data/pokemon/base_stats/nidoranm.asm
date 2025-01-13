	db DEX_NIDORAN_M ; pokedex id

	db  45,  60,  50,  50,  40
	;   hp  atk  def  spd  spc

	db NORMAL, POISON ; type
	db CR_VERY_EASY ; catch rate
	db EXP_YIELD_VERY_LOW ; base exp

	INCBIN "gfx/pokemon/front/nidoranm.pic", 0, 1 ; sprite dimensions
	dw NidoranMPicFront, NidoranMPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, HEADBUTT, TOXIC,       DOUBLE_KICK, CRUNCH,       \
			FOCUS_ENERGY, DIG,      BIDE,        SLUDGE,      VENOM_STRIKE, \
			REST,         PAY_DAY,  SUBSTITUTE,                             \
			                        SURF
	; end

	db BANK(NidoranMPicFront)
	assert BANK(NidoranMPicFront) == BANK(NidoranMPicBack)
