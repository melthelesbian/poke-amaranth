	db DEX_SPEAROW ; pokedex id

	db  40,  60,  30,  70,  30
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db CR_TRIVIAL ; catch rate
	db EXP_YIELD_VERY_LOW ; base exp

	INCBIN "gfx/pokemon/front/spearow.pic", 0, 1 ; sprite dimensions
	dw SpearowPicFront, SpearowPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm 	RAZOR_WIND,   HEADBUTT,    TOXIC,       AGILITY,     CRUNCH,       \
			FOCUS_ENERGY, MIMIC,       DOUBLE_DASH, SHADOW_TEAR, BIDE,         \
			SLUDGE,       FLARE_RUSH,  SWIFT,       SKULL_BASH,  VENOM_STRIKE, \
			REST,         HEAVY_SMASH, TWIN_SLICE,    SUBSTITUTE,                \
			CUT,          FLY
	; end

	db BANK(SpearowPicFront)
	assert BANK(SpearowPicFront) == BANK(SpearowPicBack)
