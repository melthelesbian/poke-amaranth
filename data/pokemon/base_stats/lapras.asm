	db DEX_LAPRAS ; pokedex id

	db 130,  85,  80,  60,  95
	;   hp  atk  def  spd  spc

	db WATER, ICE ; type
	db CR_VERY_HARD ; catch rate
	db EXP_YIELD_VERY_HIGH ; base exp

	INCBIN "gfx/pokemon/front/lapras.pic", 0, 1 ; sprite dimensions
	dw LaprasPicFront, LaprasPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm	BUBBLEBEAM,   ICE_BEAM,    HYPER_BEAM, LIGHT_SCREEN, REFLECT,     \
			DRAGONBREATH, THUNDERBOLT, WATERFALL,  MIMIC,        DOUBLE_DASH, \
			BIDE,         SWIFT,       SKULL_BASH, HYPNOSIS,     REST,        \
			MOONBLAST,    HEAVY_SMASH, SUBSTITUTE,                            \
			                           SURF,       STRENGTH,     FLASH
	; end

	db BANK(LaprasPicFront)
	assert BANK(LaprasPicFront) == BANK(LaprasPicBack)
