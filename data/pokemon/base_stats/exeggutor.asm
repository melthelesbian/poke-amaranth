	db DEX_EXEGGUTOR ; pokedex id

	db  95, 105,  85,  55, 125
	;   hp  atk  def  spd  spc

	db GRASS, PSYCHIC_TYPE ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/exeggutor.pic", 0, 1 ; sprite dimensions
	dw ExeggutorPicFront, ExeggutorPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, HEADBUTT,      TELEPORT,   TOXIC,        FIRE_PUNCH,   \
			ICE_PUNCH,    THUNDERPUNCH,  RAZOR_LEAF, HYPER_BEAM,   LIGHT_SCREEN, \
			REFLECT,      MEGA_DRAIN,    SOLARBEAM,  FOCUS_ENERGY, PSYCHIC_M,    \
			PSYWAVE,      MIMIC,         BIDE,       HYPNOSIS,     SKULL_BASH,   \
			REST,         SUBSTITUTE,                                            \
			                                         STRENGTH,     FLASH
	; end

	db BANK(ExeggutorPicFront)
	assert BANK(ExeggutorPicFront) == BANK(ExeggutorPicBack)
