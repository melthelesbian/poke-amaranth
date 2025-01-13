	db DEX_IVYSAUR ; pokedex id

	db  60,  60,  65,  60,  80
	;   hp  atk  def  spd  spc

	db GRASS, POISON ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/ivysaur.pic", 0, 1 ; sprite dimensions
	dw IvysaurPicFront, IvysaurPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset 
	tmhm	SWORDS_DANCE, HEADBUTT,    TOXIC,      RAZOR_LEAF,   CRUNCH,       \
			MEGA_DRAIN,   SOLARBEAM,   EARTHQUAKE, FOCUS_ENERGY, DIG,          \
			BIDE,         SLUDGE,      SKULL_BASH, HYPNOSIS,     VENOM_STRIKE, \
			REST,         HEAVY_SMASH, FURY_CUT,   SUBSTITUTE,                 \
			CUT,                                   STRENGTH
	; end

	db BANK(IvysaurPicFront)
	assert BANK(IvysaurPicFront) == BANK(IvysaurPicBack)
