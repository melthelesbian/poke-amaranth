	db DEX_KABUTOPS ; pokedex id

	db  60, 115, 100,  80,  70
	;   hp  atk  def  spd  spc

	db BUG, ROCK ; type
	db CR_VERY_HARD ; catch rate
	db EXP_YIELD_VERY_HIGH ; base exp

	INCBIN "gfx/pokemon/front/kabutops.pic", 0, 1 ; sprite dimensions
	dw KabutopsPicFront, KabutopsPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, TOXIC,      BUBBLEBEAM,   HYPER_BEAM, AGILITY,      \
			CRUNCH,       MEGA_DRAIN, FOCUS_ENERGY, DIG,        MIMIC,        \
			BIDE,         BUG_BUZZ,   SWIFT,        SKULL_BASH, VENOM_STRIKE, \
			HEAVY_SMASH,  ROCK_SLIDE, TWIN_SLICE,     SUBSTITUTE,               \
			CUT,                      SURF,         STRENGTH
	; end

	db BANK(KabutopsPicFront)
	assert BANK(KabutopsPicFront) == BANK(KabutopsPicBack)
