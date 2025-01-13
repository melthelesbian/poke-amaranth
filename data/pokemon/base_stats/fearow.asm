	db DEX_FEAROW ; pokedex id

	db  65,  90,  65, 100,  60
	;   hp  atk  def  spd  spc

	db FLYING, DARK ; type
	db CR_NORMAL ; catch rate
	db EXP_YIELD_NORMAL ; base exp

	INCBIN "gfx/pokemon/front/fearow.pic", 0, 1 ; sprite dimensions
	dw FearowPicFront, FearowPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	RAZOR_WIND,   HEADBUTT,     TOXIC,       HYPER_BEAM,  AGILITY,     \
			CRUNCH,       FOCUS_ENERGY, MIMIC,       DOUBLE_DASH, SHADOW_TEAR, \
			BIDE,         SLUDGE,       FLARE_RUSH,  SWIFT,       SKULL_BASH,  \
			VENOM_STRIKE, REST,         HEAVY_SMASH, FURY_CUT,    SUBSTITUTE,  \
			CUT,          FLY
	; end

	db BANK(FearowPicFront)
	assert BANK(FearowPicFront) == BANK(FearowPicBack)
