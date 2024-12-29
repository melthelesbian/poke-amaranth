	db DEX_ARTICUNO ; pokedex id

	db  90,  95, 100,  85, 130
	;   hp  atk  def  spd  spc

	db ICE, FLYING ; type
	db CR_CHALLENGING ; catch rate
	db EXP_YIELD_VERY_HIGH ; base exp

	INCBIN "gfx/pokemon/front/articuno.pic", 0, 1 ; sprite dimensions
	dw ArticunoPicFront, ArticunoPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND,   ICY_WIND,    TOXIC,        TAKE_DOWN,  \
	     BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   \
	     RAGE,         MIMIC,          REFLECT,      BIDE,         \
	     SWIFT,        SKY_ATTACK,   REST,         SUBSTITUTE,   FLY
	; end

	db BANK(ArticunoPicFront)
	assert BANK(ArticunoPicFront) == BANK(ArticunoPicBack)
