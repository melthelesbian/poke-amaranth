	db DEX_MACHOP ; pokedex id

	db  70,  80,  50,  35,  35
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db CR_EASY ; catch rate
	db EXP_YIELD_LOW ; base exp

	INCBIN "gfx/pokemon/front/machop.pic", 0, 1 ; sprite dimensions
	dw MachopPicFront, MachopPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH, FIRE_PUNCH, ICE_PUNCH,    THUNDERPUNCH, DOUBLE_KICK, \
			AGILITY,    SUBMISSION, FOCUS_ENERGY, BIDE,         SWIFT,       \
			REST,       PAY_DAY,    SUBSTITUTE,                              \
			                                      STRENGTH
	; end

	db BANK(MachopPicFront)
	assert BANK(MachopPicFront) == BANK(MachopPicBack)
