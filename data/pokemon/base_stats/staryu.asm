	db DEX_STARYU ; pokedex id

	db  30,  45,  55,  85,  70
	;   hp  atk  def  spd  spc

	db WATER, FAIRY ; type
	db CR_VERY_EASY ; catch rate
	db EXP_YIELD_VERY_LOW ; base exp

	INCBIN "gfx/pokemon/front/staryu.pic", 0, 1 ; sprite dimensions
	dw StaryuPicFront, StaryuPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm	RAZOR_WIND,   TELEPORT,   BUBBLEBEAM, ICE_BEAM,    LIGHT_SCREEN, \
			REFLECT,      AGILITY,    MEGA_DRAIN, THUNDERBOLT, WATERFALL,    \
			FOCUS_ENERGY, PSYCHIC_M,  PSYWAVE,    MIMIC,       DOUBLE_DASH,  \
			BIDE,         BUG_BUZZ,   SWIFT,      HYPNOSIS,    REST,         \
			MOONBLAST,    SUBSTITUTE,                                       \
			                          SURF,                    FLASH
	; end

	db BANK(StaryuPicFront)
	assert BANK(StaryuPicFront) == BANK(StaryuPicBack)
