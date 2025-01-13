	db DEX_HYPNO ; pokedex id

	db  85,  75,  70,  70, 115
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/hypno.pic", 0, 1 ; sprite dimensions
	dw HypnoPicFront, HypnoPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH,  HEADBUTT,     TELEPORT,     TOXIC,       FIRE_PUNCH,  \
			ICE_PUNCH,   THUNDERPUNCH, THUNDER_WAVE, HYPER_BEAM,  SUBMISSION,  \
			CRUNCH,      DIG,          PSYCHIC_M,    PSYWAVE,     MIMIC,       \
			BIDE,        SLUDGE,       SWIFT,        SKULL_BASH,  HYPNOSIS,    \
			DREAM_EATER, REST,         MOONBLAST,    PAY_DAY,     SUBSTITUTE,  \
			METRONOME,                                                         \
			                                         STRENGTH,    FLASH
	; end

	db BANK(HypnoPicFront)
	assert BANK(HypnoPicFront) == BANK(HypnoPicBack)
