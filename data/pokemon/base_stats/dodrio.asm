	db DEX_DODRIO ; pokedex id

	db  75, 110,  70, 110,  60
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db CR_VERY_HARD ; catch rate
	db EXP_YIELD_VERY_HIGH ; base exp

	INCBIN "gfx/pokemon/front/dodrio.pic", 0, 1 ; sprite dimensions
	dw DodrioPicFront, DodrioPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, HEADBUTT,    DOUBLE_KICK,  HYPER_BEAM, AGILITY,  \
			SUBMISSION,   CRUNCH,      FOCUS_ENERGY, DIG,        MIMIC,    \
			DOUBLE_DASH,  SHADOW_TEAR, BIDE,         FLARE_RUSH, SWIFT,    \
			SKULL_BASH,   HYPNOSIS,    REST,         ROCK_SLIDE, TWIN_SLICE, \
			SUBSTITUTE,                                                    \
			CUT,                                     STRENGTH
	; end

	db BANK(DodrioPicFront)
	assert BANK(DodrioPicFront) == BANK(DodrioPicBack)
