	db DEX_SEADRA ; pokedex id

	db  75,  95,  95,  85,  95
	;   hp  atk  def  spd  spc

	db WATER, DRAGON ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/seadra.pic", 0, 1 ; sprite dimensions
	dw SeadraPicFront, SeadraPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm 	HEADBUTT,   TOXIC,        BUBBLEBEAM,   ICE_BEAM,    THUNDER_WAVE, \
			HYPER_BEAM, LIGHT_SCREEN, REFLECT,      AGILITY,     DRAGONBREATH, \
			WATERFALL,  FOCUS_ENERGY, MIMIC,        DOUBLE_DASH, BIDE,         \
			SLUDGE,     SWIFT,        VENOM_STRIKE, REST,        MOONBLAST,    \
			SUBSTITUTE,                                                        \
			SURF,                                                FLASH
	; end

	db BANK(SeadraPicFront)
	assert BANK(SeadraPicFront) == BANK(SeadraPicBack)
