	db DEX_SEEL ; pokedex id

	db  65,  45,  55,  45,  70
	;   hp  atk  def  spd  spc

	db WATER, ICE ; type
	db CR_EASY ; catch rate
	db EXP_YIELD_LOW ; base exp

	INCBIN "gfx/pokemon/front/seel.pic", 0, 1 ; sprite dimensions
	dw SeelPicFront, SeelPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	HEADBUTT,    BUBBLEBEAM,   ICE_BEAM,  AGILITY,    CRUNCH, \
			WATERFALL,   FOCUS_ENERGY, PSYCHIC_M, PSYWAVE,    MIMIC,  \
			DOUBLE_DASH, BIDE,         SWIFT,     SKULL_BASH, REST,   \
			MOONBLAST,   HEAVY_SMASH,                                 \
			                           SURF,                  FLASH
	; end

	db BANK(SeelPicFront)
	assert BANK(SeelPicFront) == BANK(SeelPicBack)
