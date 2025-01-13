	db DEX_JIGGLYPUFF ; pokedex id

	db 115,  45,  20,  20,  45
	;   hp  atk  def  spd  spc

	db NORMAL, FAIRY ; type
	db CR_NORMAL ; catch rate
	db EXP_YIELD_NORMAL ; base exp

	INCBIN "gfx/pokemon/front/jigglypuff.pic", 0, 1 ; sprite dimensions
	dw JigglypuffPicFront, JigglypuffPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH, HEADBUTT,   FIRE_PUNCH,   ICE_PUNCH,    THUNDERPUNCH, \
			BUBBLEBEAM, ICE_BEAM,   THUNDER_WAVE, LIGHT_SCREEN, REFLECT,      \
			CRUNCH,     MEGA_DRAIN, THUNDERBOLT,  FOCUS_ENERGY, DIG,          \
			PSYCHIC_M,  PSYWAVE,    MIMIC,        DOUBLE_DASH,  BIDE,         \
			SWIFT,      SKULL_BASH, HYPNOSIS,     DREAM_EATER,  REST,         \
			MOONBLAST,  PAY_DAY,    HEAVY_SMASH,  FURY_CUT,     SUBSTITUTE,   \
			CUT,        FLY,        SURF,                       FLASH
	; end

	db BANK(JigglypuffPicFront)
	assert BANK(JigglypuffPicFront) == BANK(JigglypuffPicBack)
