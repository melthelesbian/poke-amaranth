	db DEX_BUTTERFREE ; pokedex id

	db  60,  75,  50,  70,  95
	;   hp  atk  def  spd  spc

	db BUG, FAIRY ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/butterfree.pic", 0, 1 ; sprite dimensions
	dw ButterfreePicFront, ButterfreePicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	RAZOR_WIND,   HEADBUTT, TELEPORT,    RAZOR_LEAF, HYPER_BEAM,   \
			LIGHT_SCREEN, REFLECT,  AGILITY,     MEGA_DRAIN, FOCUS_ENERGY, \
			PSYCHIC_M,    PSYWAVE,  DOUBLE_DASH, BIDE,       BUG_BUZZ,     \
			SWIFT,        HYPNOSIS, DREAM_EATER, REST,       MOONBLAST,    \
			SUBSTITUTE,                                                    \
			              FLY,                               FLASH
	; end

	db BANK(ButterfreePicFront)
	assert BANK(ButterfreePicFront) == BANK(ButterfreePicBack)
