	db DEX_CHANSEY ; pokedex id

	db 255,  10,  10,  50, 105
	;   hp  atk  def  spd  spc

	db NORMAL, FAIRY ; type
	db CR_VERY_HARD ; catch rate
	db 255 ; base exp

	INCBIN "gfx/pokemon/front/chansey.pic", 0, 1 ; sprite dimensions
	dw ChanseyPicFront, ChanseyPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm	TELEPORT,     FIRE_PUNCH, ICE_PUNCH,    THUNDERPUNCH, BUBBLEBEAM,  \
			ICE_BEAM,     HYPER_BEAM, LIGHT_SCREEN, REFLECT,      THUNDERBOLT, \
			FOCUS_ENERGY, PSYCHIC_M,  PSYWAVE,      MIMIC,        DOUBLE_DASH, \
			BIDE,         SWIFT,      SKULL_BASH,   HYPNOSIS,     DREAM_EATER, \
			REST,         MOONBLAST,  PAY_DAY,      HEAVY_SMASH,  SUBSTITUTE,  \
			                          SURF,         STRENGTH,     FLASH
	; end

	db BANK(ChanseyPicFront)
	assert BANK(ChanseyPicFront) == BANK(ChanseyPicBack)
