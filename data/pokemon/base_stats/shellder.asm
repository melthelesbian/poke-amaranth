	db DEX_SHELLDER ; pokedex id

	db  30,  65, 100,  40,  45
	;   hp  atk  def  spd  spc

	db WATER, ICE ; type
	db CR_EASY ; catch rate
	db 97 ; base exp

	INCBIN "gfx/pokemon/front/shellder.pic", 0, 1 ; sprite dimensions
	dw ShellderPicFront, ShellderPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        TAKE_DOWN,      BUBBLEBEAM,   WATER_GUN,    \
	     ICE_BEAM,     BLIZZARD,     RAGE,         TELEPORT,     MIMIC,        \
	       REFLECT,      BIDE,         SELFDESTRUCT, SWIFT,        \
	     REST,         EXPLOSION,    TRI_ATTACK,   SUBSTITUTE,   SURF
	; end

	db 0 ; padding
