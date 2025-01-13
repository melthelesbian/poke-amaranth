	db DEX_MAGNEMITE ; pokedex id

	db  25,  35,  70,  45,  95
	;   hp  atk  def  spd  spc

	db STEEL, ELECTRIC ; type
	db CR_EASY ; catch rate
	db EXP_YIELD_LOW ; base exp

	INCBIN "gfx/pokemon/front/magnemite.pic", 0, 1 ; sprite dimensions
	dw MagnemitePicFront, MagnemitePicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	TELEPORT,    THUNDER_WAVE, LIGHT_SCREEN, REFLECT,      CRUNCH,    \
			MEGA_DRAIN,  SOLARBEAM,    THUNDERBOLT,  FOCUS_ENERGY, MIMIC,     \
			BIDE,        SWIFT,        HYPNOSIS,     REST,         MOONBLAST, \
			HEAVY_SMASH, SUBSTITUTE,                                          \
			CUT,                                                   FLASH
	; end

	db BANK(MagnemitePicFront)
	assert BANK(MagnemitePicFront) == BANK(MagnemitePicBack)
