	db DEX_CHARMANDER ; pokedex id

	db  40,  50,  40,  65,  60
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db CR_NORMAL ; catch rate
	db EXP_YIELD_VERY_LOW ; base exp

	INCBIN "gfx/pokemon/front/charmander.pic", 0, 1 ; sprite dimensions
	dw CharmanderPicFront, CharmanderPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm 	MEGA_PUNCH,   SWORDS_DANCE, HEADBUTT,     AGILITY,     SUBMISSION, \
			CRUNCH,       DRAGONBREATH, FOCUS_ENERGY, DOUBLE_DASH, BIDE,       \
			FLAMETHROWER, FLARE_RUSH,   SWIFT,        SKULL_BASH,  REST,       \
			SUBSTITUTE,                                                        \
			CUT,                                      STRENGTH
	; end

	db BANK(CharmanderPicFront)
	assert BANK(CharmanderPicFront) == BANK(CharmanderPicBack)
