	db DEX_ARTICUNO ; pokedex id

	db  90,  95, 100,  85, 130
	;   hp  atk  def  spd  spc

	db ICE, FLYING ; type
	db CR_CHALLENGING ; catch rate
	db EXP_YIELD_VERY_HIGH ; base exp

	INCBIN "gfx/pokemon/front/articuno.pic", 0, 1 ; sprite dimensions
	dw ArticunoPicFront, ArticunoPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm	RAZOR_WIND,   SWORDS_DANCE, HEADBUTT,    ICE_BEAM,     HYPER_BEAM, \
			LIGHT_SCREEN, REFLECT,      AGILITY,     FOCUS_ENERGY, MIMIC,      \
			DOUBLE_DASH,  BIDE,         SWIFT,       SKULL_BASH,   HYPNOSIS,   \
			REST,         MOONBLAST,    HEAVY_SMASH, SUBSTITUTE,               \
			              FLY,          SURF,                     FLASH
	; end

	db BANK(ArticunoPicFront)
	assert BANK(ArticunoPicFront) == BANK(ArticunoPicBack)
