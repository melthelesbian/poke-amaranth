	db DEX_DEWGONG ; pokedex id

	db  90,  70,  80,  70,  95
	;   hp  atk  def  spd  spc

	db WATER, ICE ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/dewgong.pic", 0, 1 ; sprite dimensions
	dw DewgongPicFront, DewgongPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	HEADBUTT, BUBBLEBEAM,   ICE_BEAM,     HYPER_BEAM, AGILITY,    \
			CRUNCH,   WATERFALL,    FOCUS_ENERGY, PSYCHIC_M,  PSYWAVE,    \
			MIMIC,    DOUBLE_DASH,  BIDE,         SWIFT,      SKULL_BASH, \
			REST,     MOONBLAST,    HEAVY_SMASH,                          \
			                        SURF,                     FLASH

	; end

	db BANK(DewgongPicFront)
	assert BANK(DewgongPicFront) == BANK(DewgongPicBack)
