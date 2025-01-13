	db DEX_HITMONLEE ; pokedex id

	db  50, 120,  55,  90, 110
	;   hp  atk  def  spd  spc

	db FIGHTING, FIGHTING ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/hitmonlee.pic", 0, 1 ; sprite dimensions
	dw HitmonleePicFront, HitmonleePicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, HEADBUTT,     TELEPORT,    DOUBLE_KICK, HYPER_BEAM, \
			LIGHT_SCREEN, REFLECT,      AGILITY,     SUBMISSION,  CRUNCH,     \
			EARTHQUAKE,   FOCUS_ENERGY, MIMIC,       DOUBLE_DASH, BIDE,       \
			FLARE_RUSH,   SWIFT,        SKULL_BASH,  REST,        PAY_DAY,    \
			HEAVY_SMASH,  SUBSTITUTE,                                         \
			                                         STRENGTH
	; end

	db BANK(HitmonleePicFront)
	assert BANK(HitmonleePicFront) == BANK(HitmonleePicBack)
