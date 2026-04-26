	db DEX_BEEDRILL ; pokedex id

	db  70,  95,  50,  75,  60
	;   hp  atk  def  spd  spc

	db BUG, POISON ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/beedrill.pic", 0, 1 ; sprite dimensions
	dw BeedrillPicFront, BeedrillPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	RAZOR_WIND,  SWORDS_DANCE, TOXIC,      HYPER_BEAM,   AGILITY, \
			CRUNCH,      FOCUS_ENERGY, DIG,        DOUBLE_DASH,  BIDE,    \
			SLUDGE,      BUG_BUZZ,     SWIFT,      VENOM_STRIKE, REST,    \
			HEAVY_SMASH, TWIN_SLICE,     SUBSTITUTE,                        \
			CUT,         FLY
	; end

	db BANK(BeedrillPicFront)
	assert BANK(BeedrillPicFront) == BANK(BeedrillPicBack)
