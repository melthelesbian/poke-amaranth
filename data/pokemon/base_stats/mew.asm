	db DEX_MEW ; pokedex id

	db 115, 115, 115, 115, 115
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db CR_CHALLENGING ; catch rate
	db EXP_YIELD_VERY_HIGH ; base exp

	INCBIN "gfx/pokemon/front/mew.pic", 0, 1 ; sprite dimensions
	dw MewPicFront, MewPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   RAZOR_WIND,   SWORDS_DANCE, HEADBUTT,     TELEPORT,     \
	     TOXIC,        FIRE_PUNCH,   ICE_PUNCH,    THUNDERPUNCH, RAZOR_LEAF,   \
	     BUBBLEBEAM,   DOUBLE_KICK,  ICE_BEAM,     THUNDER_WAVE, HYPER_BEAM,   \
	     LIGHT_SCREEN, REFLECT,      AGILITY,      SUBMISSION,   CRUNCH,       \
	     MEGA_DRAIN,   SOLARBEAM,    DRAGONBREATH, THUNDERBOLT,  WATERFALL,    \
	     EARTHQUAKE,   FOCUS_ENERGY, DIG,          PSYCHIC_M,    PSYWAVE,      \
	     MIMIC,        DOUBLE_DASH,  SHADOW_TEAR,  BIDE,         FLAMETHROWER, \
	     SLUDGE,       BUG_BUZZ,     FLARE_RUSH,   SWIFT,        SKULL_BASH,   \
	     HYPNOSIS,     DREAM_EATER,  VENOM_STRIKE, REST,         MOONBLAST,    \
	     PAY_DAY,      HEAVY_SMASH,  ROCK_SLIDE,   TWIN_SLICE,     SUBSTITUTE,   \
		 METRONOME,                                                            \
	     CUT,          FLY,          SURF,         STRENGTH,     FLASH,        \
	; end

	db BANK(MewPicFront)
	assert BANK(MewPicFront) == BANK(MewPicBack)
