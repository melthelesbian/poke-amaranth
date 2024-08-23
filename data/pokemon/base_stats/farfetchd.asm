	db DEX_FARFETCHD ; pokedex id

	db  52,  65,  55,  60,  58
	;   hp  atk  def  spd  spc

	db FLYING, FIGHTING ; type
	db CR_NORMAL ; catch rate
	db 94 ; base exp

	INCBIN "gfx/pokemon/front/farfetchd.pic", 0, 1 ; sprite dimensions
	dw FarfetchdPicFront, FarfetchdPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm RAZOR_WIND,   SWORDS_DANCE,     TOXIC,        BODY_SLAM,    \
	     TAKE_DOWN,      RAGE,         MIMIC,        DOUBLE_DASH,  \
	     REFLECT,      BIDE,         SWIFT,        SKULL_BASH,   REST,         \
	     SUBSTITUTE,   CUT,          FLY
	; end

	db 0 ; padding
