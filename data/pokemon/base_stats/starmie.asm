	db DEX_STARMIE ; pokedex id

	db  60,  75,  85, 115, 100
	;   hp  atk  def  spd  spc

	db WATER, FAIRY ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/starmie.pic", 0, 1 ; sprite dimensions
	dw StarmiePicFront, StarmiePicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm	RAZOR_WIND,   TELEPORT,     BUBBLEBEAM,  ICE_BEAM,   HYPER_BEAM,  \
			LIGHT_SCREEN, REFLECT,      AGILITY,     MEGA_DRAIN, THUNDERBOLT, \
			WATERFALL,    FOCUS_ENERGY, PSYCHIC_M,   PSYWAVE,    MIMIC,       \
			DOUBLE_DASH,  BIDE,         BUG_BUZZ,    SWIFT,      HYPNOSIS,    \
			REST,         MOONBLAST,    HEAVY_SMASH, SUBSTITUTE,              \
			                            SURF,                    FLASH
	; end

	db BANK(StarmiePicFront)
	assert BANK(StarmiePicFront) == BANK(StarmiePicBack)
