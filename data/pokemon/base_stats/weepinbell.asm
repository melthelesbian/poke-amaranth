	db DEX_WEEPINBELL ; pokedex id

	db  65,  90,  50,  55,  85
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db CR_EASY ; catch rate
	db EXP_YIELD_LOW ; base exp

	INCBIN "gfx/pokemon/front/weepinbell.pic", 0, 1 ; sprite dimensions
	dw WeepinbellPicFront, WeepinbellPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm	HEADBUTT,   TOXIC,        RAZOR_LEAF, LIGHT_SCREEN, REFLECT,    \
			MEGA_DRAIN, SOLARBEAM,    EARTHQUAKE, FOCUS_ENERGY, BIDE,       \
			SLUDGE,     VENOM_STRIKE, REST,       TWIN_SLICE,     SUBSTITUTE, \
			CUT,                                                FLASH
	; end

	db BANK(WeepinbellPicFront)
	assert BANK(WeepinbellPicFront) == BANK(WeepinbellPicBack)
