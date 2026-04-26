	db DEX_WIGGLYTUFF ; pokedex id

	db 140,  70,  45,  45,  75
	;   hp  atk  def  spd  spc

	db NORMAL, FAIRY ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/wigglytuff.pic", 0, 1 ; sprite dimensions
	dw WigglytuffPicFront, WigglytuffPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm 	MEGA_PUNCH, HEADBUTT,  FIRE_PUNCH,   ICE_PUNCH,   THUNDERPUNCH, \
			BUBBLEBEAM, ICE_BEAM,  THUNDER_WAVE, HYPER_BEAM,  LIGHT_SCREEN, \
			REFLECT,    CRUNCH,    MEGA_DRAIN,   THUNDERBOLT, FOCUS_ENERGY, \
			DIG,        PSYCHIC_M, PSYWAVE,      MIMIC,       DOUBLE_DASH,  \
			BIDE,       SWIFT,     SKULL_BASH,   HYPNOSIS,    DREAM_EATER,  \
			REST,       MOONBLAST, PAY_DAY,      HEAVY_SMASH, TWIN_SLICE,     \
			SUBSTITUTE,                                                     \
			CUT,                   SURF,         STRENGTH,    FLASH
	; end

	db BANK(WigglytuffPicFront)
	assert BANK(WigglytuffPicFront) == BANK(WigglytuffPicBack)
