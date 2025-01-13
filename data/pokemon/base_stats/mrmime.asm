	db DEX_MR_MIME ; pokedex id

	db  50,  45,  65,  90, 120
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, FAIRY ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/mr.mime.pic", 0, 1 ; sprite dimensions
	dw MrMimePicFront, MrMimePicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH,   SWORDS_DANCE, HEADBUTT,    TELEPORT,    FIRE_PUNCH,   \
			ICE_PUNCH,    THUNDERPUNCH, DOUBLE_KICK, ICE_BEAM,    HYPER_BEAM,   \
			LIGHT_SCREEN, REFLECT,      AGILITY,     SUBMISSION,  FOCUS_ENERGY, \
			PSYCHIC_M,    PSYWAVE,      MIMIC,       DOUBLE_DASH, BIDE,         \
			SWIFT,        SKULL_BASH,   HYPNOSIS,    REST,        MOONBLAST,    \
			PAY_DAY,      SUBSTITUTE,   METRONOME,                              \
			                                         STRENGTH,    FLASH
	; end

	db BANK(MrMimePicFront)
	assert BANK(MrMimePicFront) == BANK(MrMimePicBack)
