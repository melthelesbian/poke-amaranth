	db DEX_ONIX ; pokedex id

	db  50,  65, 175,  50,  60
	;   hp  atk  def  spd  spc

	db ROCK, ROCK ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/onix.pic", 0, 1 ; sprite dimensions
	dw OnixPicFront, OnixPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, HEADBUTT,   HYPER_BEAM,  AGILITY,     CRUNCH,    \
			DRAGONBREATH, EARTHQUAKE, DIG,         BIDE,       SKULL_BASH, \
			HYPNOSIS,     REST,       HEAVY_SMASH, ROCK_SLIDE, FURY_CUT,   \
			SUBSTITUTE,                                                    \
			CUT,                                   STRENGTH
	; end

	db BANK(OnixPicFront)
	assert BANK(OnixPicFront) == BANK(OnixPicBack)
