	db DEX_PIDGEY ; pokedex id

	db  40,  45,  40,  55,  35
	;   hp  atk  def  spd  spc

	db NORMAL, FLYING ; type
	db CR_TRIVIAL ; catch rate
	db EXP_YIELD_VERY_LOW ; base exp

	INCBIN "gfx/pokemon/front/pidgey.pic", 0, 1 ; sprite dimensions
	dw PidgeyPicFront, PidgeyPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm	RAZOR_WIND,  SWORDS_DANCE, HEADBUTT,   AGILITY, FOCUS_ENERGY, \
			DOUBLE_DASH, BIDE,         FLARE_RUSH, SWIFT,   REST,         \
			SUBSTITUTE,                                                   \
			             FLY
	; end

	db BANK(PidgeyPicFront)
	assert BANK(PidgeyPicFront) == BANK(PidgeyPicBack)
