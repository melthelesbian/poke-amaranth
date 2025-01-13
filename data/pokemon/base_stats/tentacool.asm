	db DEX_TENTACOOL ; pokedex id

	db  40,  40,  35,  70, 100
	;   hp  atk  def  spd  spc

	db WATER, POISON ; type
	db CR_EASY ; catch rate
	db EXP_YIELD_LOW ; base exp

	INCBIN "gfx/pokemon/front/tentacool.pic", 0, 1 ; sprite dimensions
	dw TentacoolPicFront, TentacoolPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm	TOXIC,  ICE_PUNCH, BUBBLEBEAM,   ICE_BEAM,     THUNDER_WAVE, \
			CRUNCH, WATERFALL, FOCUS_ENERGY, PSYCHIC_M,    PSYWAVE,      \
			MIMIC,  BIDE,      SLUDGE,       VENOM_STRIKE, REST,         \
			SUBSTITUTE,                                                  \
			                   SURF,         STRENGTH
	; end

	db BANK(TentacoolPicFront)
	assert BANK(TentacoolPicFront) == BANK(TentacoolPicBack)
