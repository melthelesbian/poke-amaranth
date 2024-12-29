	db DEX_NIDORINA ; pokedex id

	db  70,  65,  70,  60,  55
	;   hp  atk  def  spd  spc

	db NORMAL, GROUND ; type
	db CR_NORMAL ; catch rate
	db EXP_YIELD_NORMAL ; base exp

	INCBIN "gfx/pokemon/front/nidorina.pic", 0, 1 ; sprite dimensions
	dw NidorinaPicFront, NidorinaPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,           BODY_SLAM,    TAKE_DOWN,      \
	     BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     RAGE,         \
	     THUNDERBOLT,  THUNDER,      MIMIC,          REFLECT,      \
	     BIDE,         SKULL_BASH,   REST,         SUBSTITUTE
	; end

	db BANK(NidorinaPicFront)
	assert BANK(NidorinaPicFront) == BANK(NidorinaPicBack)
