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
	tmhm	MEGA_PUNCH,   RAZOR_WIND,   SWORDS_DANCE, HEADBUTT,    FIRE_PUNCH, \
			ICE_PUNCH,    THUNDERPUNCH, HYPER_BEAM,   AGILITY,     SUBMISSION, \
			CRUNCH,       DRAGONBREATH, FOCUS_ENERGY, DOUBLE_DASH, BIDE,       \
			FLAMETHROWER, FLARE_RUSH,   SWIFT,        SKULL_BASH,  REST,       \
			HEAVY_SMASH,  SUBSTITUTE,                                          \
			CUT,          FLY,                        STRENGTH
	; end

	db BANK(CharizardPicFront)
	assert BANK(CharizardPicFront) == BANK(CharizardPicBack)
