	db DEX_GOLBAT ; pokedex id

	db  80,  85,  75, 105,  75
	;   hp  atk  def  spd  spc

	db POISON, FLYING ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/golbat.pic", 0, 1 ; sprite dimensions
	dw GolbatPicFront, GolbatPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND,   ICY_WIND,    TOXIC,        TAKE_DOWN,      \
	     HYPER_BEAM,   RAGE,         MEGA_DRAIN,   MIMIC,          \
	     BIDE,         SWIFT,        REST,         SUBSTITUTE
	; end

	db BANK(GolbatPicFront)
	assert BANK(GolbatPicFront) == BANK(GolbatPicBack)
