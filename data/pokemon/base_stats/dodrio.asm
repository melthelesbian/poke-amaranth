	db DEX_DODRIO ; pokedex id

	db  75, 110,  70, 110,  60
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db CR_VERY_HARD ; catch rate
	db EXP_YIELD_VERY_HIGH ; base exp

	INCBIN "gfx/pokemon/front/dodrio.pic", 0, 1 ; sprite dimensions
	dw DodrioPicFront, DodrioPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm ICY_WIND,    TOXIC,        BODY_SLAM,    TAKE_DOWN,      \
	     HYPER_BEAM,   RAGE,         MIMIC,        DOUBLE_DASH,  REFLECT,      \
	     BIDE,         SKULL_BASH,   SKY_ATTACK,   REST,         TRI_ATTACK,   \
	     SUBSTITUTE
	; end

	db BANK(DodrioPicFront)
	assert BANK(DodrioPicFront) == BANK(DodrioPicBack)
