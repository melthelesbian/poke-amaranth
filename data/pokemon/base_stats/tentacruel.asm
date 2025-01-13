	db DEX_TENTACRUEL ; pokedex id

	db  80,  70,  65, 100, 120
	;   hp  atk  def  spd  spc

	db WATER, POISON ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/tentacruel.pic", 0, 1 ; sprite dimensions
	dw TentacruelPicFront, TentacruelPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm	TOXIC,      ICE_PUNCH,   BUBBLEBEAM, ICE_BEAM,     THUNDER_WAVE, \
			HYPER_BEAM, CRUNCH,      WATERFALL,  FOCUS_ENERGY, PSYCHIC_M,    \
			PSYWAVE,    MIMIC,       BIDE,       SLUDGE,       VENOM_STRIKE, \
			REST,       HEAVY_SMASH, SUBSTITUTE,                             \
			SURF, STRENGTH
	; end

	db BANK(TentacruelPicFront)
	assert BANK(TentacruelPicFront) == BANK(TentacruelPicBack)
