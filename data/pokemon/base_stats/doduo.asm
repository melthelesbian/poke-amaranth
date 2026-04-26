	db DEX_DODUO ; pokedex id

	db  35,  85,  45,  75,  35
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db CR_NORMAL ; catch rate
	db EXP_YIELD_NORMAL ; base exp

	INCBIN "gfx/pokemon/front/doduo.pic", 0, 1 ; sprite dimensions
	dw DoduoPicFront, DoduoPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, HEADBUTT,     DOUBLE_KICK, AGILITY,  SUBMISSION,  \
			CRUNCH,       FOCUS_ENERGY, DIG,         MIMIC,    DOUBLE_DASH, \
			SHADOW_TEAR,  BIDE,         FLARE_RUSH,  SWIFT,    SKULL_BASH,  \
			HYPNOSIS,     REST,         ROCK_SLIDE,  TWIN_SLICE, SUBSTITUTE,  \
			CUT,                                     STRENGTH

	; end

	db BANK(DoduoPicFront)
	assert BANK(DoduoPicFront) == BANK(DoduoPicBack)
