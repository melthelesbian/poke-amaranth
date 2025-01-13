	db DEX_JOLTEON ; pokedex id

	db  65,  75,  60, 125, 125
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/jolteon.pic", 0, 1 ; sprite dimensions
	dw JolteonPicFront, JolteonPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, HEADBUTT,    DOUBLE_KICK, THUNDER_WAVE, HYPER_BEAM, \
			AGILITY,      CRUNCH,      THUNDERBOLT, FOCUS_ENERGY, DIG,        \
			MIMIC,        DOUBLE_DASH, BIDE,        SWIFT,        SKULL_BASH, \
			REST,         SUBSTITUTE,                                         \
			                                        STRENGTH,     FLASH
	; end

	db BANK(JolteonPicFront)
	assert BANK(JolteonPicFront) == BANK(JolteonPicBack)
