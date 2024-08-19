	db DEX_GOLDEEN ; pokedex id

	db  45,  67,  60,  63,  50
	;   hp  atk  def  spd  spc

	db WATER, WATER ; type
	db 225 ; catch rate
	db 111 ; base exp

	INCBIN "gfx/pokemon/front/goldeen.pic", 0, 1 ; sprite dimensions
	dw GoldeenPicFront, GoldeenPicBack

	db PECK, LEER, BUBBLE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,           TAKE_DOWN,      BUBBLEBEAM,   \
	     WATER_GUN,    ICE_BEAM,     BLIZZARD,     RAGE,         MIMIC,        \
	       BIDE,         SWIFT,        SKULL_BASH,   REST,         \
	     SUBSTITUTE,   SURF
	; end

	db 0 ; padding
