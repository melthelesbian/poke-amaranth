	db DEX_HITMONCHAN ; pokedex id

	db  50, 105,  80,  80, 110
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/hitmonchan.pic", 0, 1 ; sprite dimensions
	dw HitmonchanPicFront, HitmonchanPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH,  SWORDS_DANCE, HEADBUTT,     TELEPORT,    FIRE_PUNCH,  \
			ICE_PUNCH,   THUNDERPUNCH, DOUBLE_KICK,  HYPER_BEAM,  AGILITY,     \
			SUBMISSION,  CRUNCH,       FOCUS_ENERGY, MIMIC,       DOUBLE_DASH, \
			BIDE,        SWIFT,        VENOM_STRIKE, REST,        PAY_DAY,     \
			HEAVY_SMASH, TWIN_SLICE,     SUBSTITUTE,                             \
			                                         STRENGTH
	; end

	db BANK(HitmonchanPicFront)
	assert BANK(HitmonchanPicFront) == BANK(HitmonchanPicBack)
