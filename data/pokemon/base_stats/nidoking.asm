	db DEX_NIDOKING ; pokedex id

	db  70, 115,  80,  85,  75
	;   hp  atk  def  spd  spc

	db DARK, POISON ; type
	db CR_VERY_HARD ; catch rate
	db EXP_YIELD_VERY_HIGH ; base exp

	INCBIN "gfx/pokemon/front/nidoking.pic", 0, 1 ; sprite dimensions
	dw NidokingPicFront, NidokingPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH,   SWORDS_DANCE, HEADBUTT,    TOXIC,      FIRE_PUNCH,  \
			ICE_PUNCH,    THUNDERPUNCH, DOUBLE_KICK, HYPER_BEAM, CRUNCH,      \
			DRAGONBREATH, FOCUS_ENERGY, DIG,         BIDE,       SLUDGE,      \
			SKULL_BASH,   VENOM_STRIKE, REST,        PAY_DAY,    HEAVY_SMASH, \
			SUBSTITUTE,                                                       \
			                            SURF,        STRENGTH
	; end

	db BANK(NidokingPicFront)
	assert BANK(NidokingPicFront) == BANK(NidokingPicBack)
