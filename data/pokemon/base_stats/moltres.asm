	db DEX_MOLTRES ; pokedex id

	db  90, 100,  95,  90, 125
	;   hp  atk  def  spd  spc

	db FIRE, FLYING ; type
	db CR_CHALLENGING ; catch rate
	db EXP_YIELD_VERY_HIGH ; base exp

	INCBIN "gfx/pokemon/front/moltres.pic", 0, 1 ; sprite dimensions
	dw MoltresPicFront, MoltresPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm	RAZOR_WIND, SWORDS_DANCE, HEADBUTT,     HYPER_BEAM, AGILITY,     \
			CRUNCH,     SOLARBEAM,    FOCUS_ENERGY, MIMIC,      DOUBLE_DASH, \
			BIDE,       FLAMETHROWER, FLARE_RUSH,   SWIFT,      SKULL_BASH,  \
			REST,       HEAVY_SMASH,  TWIN_SLICE,     SUBSTITUTE,              \
			            FLY,                        STRENGTH,   FLASH
	; end

	db BANK(MoltresPicFront)
	assert BANK(MoltresPicFront) == BANK(MoltresPicBack)
