	db DEX_EXEGGCUTE ; pokedex id

	db  60,  40,  80,  40,  60
	;   hp  atk  def  spd  spc

	db GRASS, PSYCHIC_TYPE ; type
	db CR_EASY ; catch rate
	db EXP_YIELD_LOW ; base exp

	INCBIN "gfx/pokemon/front/exeggcute.pic", 0, 1 ; sprite dimensions
	dw ExeggcutePicFront, ExeggcutePicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, HEADBUTT,   TELEPORT,   TOXIC,     RAZOR_LEAF,   \
			LIGHT_SCREEN, REFLECT,    MEGA_DRAIN, SOLARBEAM, FOCUS_ENERGY, \
			PSYCHIC_M,    PSYWAVE,    MIMIC,      BIDE,      HYPNOSIS,     \
			REST,         SUBSTITUTE,                                      \
			                                                 FLASH
	; end

	db BANK(ExeggcutePicFront)
	assert BANK(ExeggcutePicFront) == BANK(ExeggcutePicBack)
