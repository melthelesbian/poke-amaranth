	db DEX_MACHAMP ; pokedex id

	db  90, 130,  80,  55,  75
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db CR_VERY_HARD ; catch rate
	db EXP_YIELD_VERY_HIGH ; base exp

	INCBIN "gfx/pokemon/front/machamp.pic", 0, 1 ; sprite dimensions
	dw MachampPicFront, MachampPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH, FIRE_PUNCH, ICE_PUNCH,  THUNDERPUNCH, DOUBLE_KICK, \
			HYPER_BEAM, AGILITY,    SUBMISSION, FOCUS_ENERGY, BIDE,        \
			SWIFT,      REST,       PAY_DAY,    SUBSTITUTE,                \
			                                    STRENGTH
	; end

	db BANK(MachampPicFront)
	assert BANK(MachampPicFront) == BANK(MachampPicBack)
