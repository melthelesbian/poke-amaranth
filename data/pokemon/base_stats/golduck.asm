	db DEX_GOLDUCK ; pokedex id

	db  80,  85,  75,  85,  95
	;   hp  atk  def  spd  spc

	db WATER, PSYCHIC_TYPE ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/golduck.pic", 0, 1 ; sprite dimensions
	dw GolduckPicFront, GolduckPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH, SWORDS_DANCE, HEADBUTT,   TELEPORT,    FIRE_PUNCH,   \
			ICE_PUNCH,  THUNDERPUNCH, BUBBLEBEAM, DOUBLE_KICK, ICE_BEAM,     \
			HYPER_BEAM, AGILITY,      CRUNCH,     WATERFALL,   FOCUS_ENERGY, \
			PSYCHIC_M,  PSYWAVE,      MIMIC,      DOUBLE_DASH, BIDE,         \
			SWIFT,      SKULL_BASH,   HYPNOSIS,   REST,        SUBSTITUTE,   \
			                          SURF,       STRENGTH,    FLASH
	; end

	db BANK(GolduckPicFront)
	assert BANK(GolduckPicFront) == BANK(GolduckPicBack)
