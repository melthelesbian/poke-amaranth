	db DEX_PSYDUCK ; pokedex id

	db  50,  50,  50,  55,  65
	;   hp  atk  def  spd  spc

	db WATER, PSYCHIC_TYPE ; type
	db CR_EASY ; catch rate
	db EXP_YIELD_LOW ; base exp

	INCBIN "gfx/pokemon/front/psyduck.pic", 0, 1 ; sprite dimensions
	dw PsyduckPicFront, PsyduckPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH, SWORDS_DANCE, HEADBUTT,    TELEPORT,     FIRE_PUNCH, \
			ICE_PUNCH,  THUNDERPUNCH, BUBBLEBEAM,  DOUBLE_KICK,  ICE_BEAM,   \
			AGILITY,    CRUNCH,       WATERFALL,   FOCUS_ENERGY, PSYCHIC_M,  \
			PSYWAVE,    MIMIC,        DOUBLE_DASH, BIDE,         SWIFT,      \
			SKULL_BASH, HYPNOSIS,     REST,        SUBSTITUTE,               \
			                          SURF,        STRENGTH,     FLASH
	; end

	db BANK(PsyduckPicFront)
	assert BANK(PsyduckPicFront) == BANK(PsyduckPicBack)
