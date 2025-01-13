	db DEX_TANGELA ; pokedex id

	db  80,  75, 120,  50, 105
	;   hp  atk  def  spd  spc

	db GRASS, GRASS ; type
	db CR_NORMAL ; catch rate
	db EXP_YIELD_NORMAL ; base exp

	INCBIN "gfx/pokemon/front/tangela.pic", 0, 1 ; sprite dimensions
	dw TangelaPicFront, TangelaPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, HEADBUTT, TOXIC,      RAZOR_LEAF,  DOUBLE_KICK,  \
			HYPER_BEAM,   AGILITY,  MEGA_DRAIN, SOLARBEAM,   FOCUS_ENERGY, \
			DIG,          PSYWAVE,  MIMIC,      DOUBLE_DASH, BIDE,         \
			SWIFT,        REST,     PAY_DAY,    HEAVY_SMASH, FURY_CUT,     \
			SUBSTITUTE,                                                    \
			CUT,                    SURF
	; end

	db BANK(TangelaPicFront)
	assert BANK(TangelaPicFront) == BANK(TangelaPicBack)
