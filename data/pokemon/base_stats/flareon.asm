	db DEX_FLAREON ; pokedex id

	db  65, 125,  60,  75, 125
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/flareon.pic", 0, 1 ; sprite dimensions
	dw FlareonPicFront, FlareonPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, HEADBUTT,     DOUBLE_KICK, HYPER_BEAM, AGILITY,     \
			CRUNCH,       FOCUS_ENERGY, DIG,         MIMIC,      DOUBLE_DASH, \
			BIDE,         FLAMETHROWER, FLARE_RUSH,  SWIFT,      SKULL_BASH,  \
			REST,         SUBSTITUTE,                                         \
			                                         STRENGTH,   FLASH
	; end

	db BANK(FlareonPicFront)
	assert BANK(FlareonPicFront) == BANK(FlareonPicBack)
