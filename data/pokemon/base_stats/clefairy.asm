	db DEX_CLEFAIRY ; pokedex id

	db  70,  45,  50,  35,  65
	;   hp  atk  def  spd  spc

	db FAIRY, FAIRY ; type
	db CR_NORMAL ; catch rate
	db EXP_YIELD_NORMAL ; base exp

	INCBIN "gfx/pokemon/front/clefairy.pic", 0, 1 ; sprite dimensions
	dw ClefairyPicFront, ClefairyPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH,   SWORDS_DANCE, HEADBUTT,    TELEPORT,    FIRE_PUNCH,   \
			ICE_PUNCH,    THUNDERPUNCH, BUBBLEBEAM,  ICE_BEAM,    THUNDER_WAVE, \
			LIGHT_SCREEN, REFLECT,      SOLARBEAM,   THUNDERBOLT, FOCUS_ENERGY, \
			PSYCHIC_M,    PSYWAVE,      MIMIC,       DOUBLE_DASH, BIDE,         \
			FLAMETHROWER, SWIFT,        HYPNOSIS,    DREAM_EATER, REST,         \
			MOONBLAST,    PAY_DAY,      HEAVY_SMASH, SUBSTITUTE,  METRONOME,    \
			                            SURF,        STRENGTH,    FLASH
	; end

	db BANK(ClefairyPicFront)
	assert BANK(ClefairyPicFront) == BANK(ClefairyPicBack)
