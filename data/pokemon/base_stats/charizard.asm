	db DEX_CHARIZARD ; pokedex id

	db  75,  80,  75, 100, 100
	;   hp  atk  def  spd  spc

	db FIRE, DRAGON ; type
	db CR_VERY_HARD ; catch rate
	db EXP_YIELD_VERY_HIGH ; base exp

	INCBIN "gfx/pokemon/front/charizard.pic", 0, 1 ; sprite dimensions
	dw CharizardPicFront, CharizardPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   SWORDS_DANCE,     TOXIC,        BODY_SLAM,    \
	     TAKE_DOWN,    FLARE_RUSH,  HYPER_BEAM,   SUBMISSION,   COUNTER,      \
	     SEISMIC_TOSS, RAGE,         DRAGON_RAGE,  EARTHQUAKE,   FISSURE,      \
	     DIG,          MIMIC,          REFLECT,      BIDE,         \
	     FIRE_BLAST,   SWIFT,        SKULL_BASH,   REST,         SUBSTITUTE,   \
	     CUT,          FLY,          STRENGTH
	; end

	db BANK(CharizardPicFront)
	assert BANK(CharizardPicFront) == BANK(CharizardPicBack)
