	db DEX_MACHOKE ; pokedex id

	db  80, 100,  70,  45,  60
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/machoke.pic", 0, 1 ; sprite dimensions
	dw MachokePicFront, MachokePicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm 	MEGA_PUNCH, FIRE_PUNCH, ICE_PUNCH,    THUNDERPUNCH, DOUBLE_KICK, \
			AGILITY,    SUBMISSION, FOCUS_ENERGY, BIDE,         SWIFT,       \
			REST,       PAY_DAY,    SUBSTITUTE,                              \
			                                      STRENGTH
	; end

	db BANK(MachokePicFront)
	assert BANK(MachokePicFront) == BANK(MachokePicBack)
