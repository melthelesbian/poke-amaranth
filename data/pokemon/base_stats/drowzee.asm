	db DEX_DROWZEE ; pokedex id

	db  60,  50,  45,  40,  90
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db CR_EASY ; catch rate
	db EXP_YIELD_LOW ; base exp

	INCBIN "gfx/pokemon/front/drowzee.pic", 0, 1 ; sprite dimensions
	dw DrowzeePicFront, DrowzeePicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH, HEADBUTT,     TELEPORT,     TOXIC,       FIRE_PUNCH,  \
			ICE_PUNCH,  THUNDERPUNCH, THUNDER_WAVE, SUBMISSION,  CRUNCH,      \
			DIG,        PSYCHIC_M,    PSYWAVE,      MIMIC,       BIDE,        \
			SLUDGE,     SWIFT,        SKULL_BASH,   HYPNOSIS,    DREAM_EATER, \
			REST,       MOONBLAST,    PAY_DAY,      SUBSTITUTE,  METRONOME,   \
			                                        STRENGTH,    FLASH
	; end

	db BANK(DrowzeePicFront)
	assert BANK(DrowzeePicFront) == BANK(DrowzeePicBack)
