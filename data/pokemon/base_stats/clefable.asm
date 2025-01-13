	db DEX_CLEFABLE ; pokedex id

	db  95,  70,  75,  60,  95
	;   hp  atk  def  spd  spc

	db FAIRY, FAIRY ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/clefable.pic", 0, 1 ; sprite dimensions
	dw ClefablePicFront, ClefablePicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH,   SWORDS_DANCE, HEADBUTT,   TELEPORT,    FIRE_PUNCH,   \
			ICE_PUNCH,    THUNDERPUNCH, BUBBLEBEAM, ICE_BEAM,    THUNDER_WAVE, \
			HYPER_BEAM,   LIGHT_SCREEN, REFLECT,    SOLARBEAM,   THUNDERBOLT,  \
			FOCUS_ENERGY, PSYCHIC_M,    PSYWAVE,    MIMIC,       DOUBLE_DASH,  \
			BIDE,         FLAMETHROWER, SWIFT,      HYPNOSIS,    DREAM_EATER,  \
			REST,         MOONBLAST,    PAY_DAY,    HEAVY_SMASH, SUBSTITUTE,   \
			METRONOME,                                                         \
			                            SURF,       STRENGTH,    FLASH
	; end

	db BANK(ClefablePicFront)
	assert BANK(ClefablePicFront) == BANK(ClefablePicBack)
