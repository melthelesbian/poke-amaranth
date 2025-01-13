	db DEX_RATICATE ; pokedex id

	db  55,  85,  60, 100,  50
	;   hp  atk  def  spd  spc

	db NORMAL, DARK ; type
	db CR_NORMAL ; catch rate
	db EXP_YIELD_NORMAL ; base exp

	INCBIN "gfx/pokemon/front/raticate.pic", 0, 1 ; sprite dimensions
	dw RaticatePicFront, RaticatePicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, HEADBUTT,   TOXIC,        DOUBLE_KICK, HYPER_BEAM, \
			AGILITY,      CRUNCH,     FOCUS_ENERGY, DIG,         MIMIC,      \
			BIDE,         SKULL_BASH, REST,         PAY_DAY,     SUBSTITUTE, \
			CUT,                                    STRENGTH
	; end

	db BANK(RaticatePicFront)
	assert BANK(RaticatePicFront) == BANK(RaticatePicBack)
