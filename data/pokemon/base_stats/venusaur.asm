	db DEX_VENUSAUR ; pokedex id

	db  80,  85,  85,  80, 100
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db CR_VERY_HARD ; catch rate
	db EXP_YIELD_VERY_HIGH ; base exp

	INCBIN "gfx/pokemon/front/venusaur.pic", 0, 1 ; sprite dimensions
	dw VenusaurPicFront, VenusaurPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, HEADBUTT,   TOXIC,       RAZOR_LEAF, HYPER_BEAM, \
			CRUNCH,       MEGA_DRAIN, SOLARBEAM,   EARTHQUAKE, FOCUS_ENERGY, \
			DIG,          BIDE,       SLUDGE,      SKULL_BASH, HYPNOSIS, \
			VENOM_STRIKE, REST,       HEAVY_SMASH, TWIN_SLICE,   SUBSTITUTE, \
			CUT,                                   STRENGTH
	; end

	db BANK(VenusaurPicFront)
	assert BANK(VenusaurPicFront) == BANK(VenusaurPicBack)
