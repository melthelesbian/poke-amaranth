	db DEX_GLOOM ; pokedex id

	db  60,  65,  70,  40,  85
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db CR_EASY ; catch rate
	db EXP_YIELD_LOW ; base exp

	INCBIN "gfx/pokemon/front/gloom.pic", 0, 1 ; sprite dimensions
	dw GloomPicFront, GloomPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH,   SWORDS_DANCE, HEADBUTT, TOXIC,       RAZOR_LEAF, \
			LIGHT_SCREEN, REFLECT,      CRUNCH,   MEGA_DRAIN,  SOLARBEAM,  \
			FOCUS_ENERGY, DIG,          BIDE,     SLUDGE,      HYPNOSIS,   \
			VENOM_STRIKE, REST,         PAY_DAY,  HEAVY_SMASH, FURY_CUT,   \
			SUBSTITUTE,                                                    \
			CUT,                                  STRENGTH,    FLASH
	; end

	db BANK(GloomPicFront)
	assert BANK(GloomPicFront) == BANK(GloomPicBack)
