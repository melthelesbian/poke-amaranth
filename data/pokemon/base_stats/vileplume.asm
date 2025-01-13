	db DEX_VILEPLUME ; pokedex id

	db  75,  95,  95,  50, 110
	;   hp  atk  def  spd  spc

	db GRASS, DARK ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/vileplume.pic", 0, 1 ; sprite dimensions
	dw VileplumePicFront, VileplumePicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH, SWORDS_DANCE, HEADBUTT, TOXIC,    RAZOR_LEAF,  \
			HYPER_BEAM, LIGHT_SCREEN, REFLECT,  CRUNCH,   MEGA_DRAIN,  \
			SOLARBEAM,  FOCUS_ENERGY, DIG,      BIDE,     SLUDGE,      \
			HYPNOSIS,   VENOM_STRIKE, REST,     PAY_DAY,  HEAVY_SMASH, \
			FURY_CUT,   SUBSTITUTE,                                    \
			CUT,                                STRENGTH, FLASH
	; end

	db BANK(VileplumePicFront)
	assert BANK(VileplumePicFront) == BANK(VileplumePicBack)
