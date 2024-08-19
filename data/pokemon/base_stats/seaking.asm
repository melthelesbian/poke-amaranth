	db DEX_SEAKING ; pokedex id

	db  80,  92,  65,  68,  80
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 60 ; catch rate
	db 170 ; base exp

	INCBIN "gfx/pokemon/front/seaking.pic", 0, 1 ; sprite dimensions
	dw SeakingPicFront, SeakingPicBack

	db PECK, TAIL_WHIP, SWEET_CRY, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        BUG_BUZZ,   TAKE_DOWN,    FLARE_RUSH,  BUBBLEBEAM,   \
	     WATER_GUN,    ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   RAGE,         \
	     MIMIC,        DOUBLE_DASH,  BIDE,         SWIFT,        SKULL_BASH,   \
	     REST,         SUBSTITUTE,   SURF
	; end

	db 0 ; padding
