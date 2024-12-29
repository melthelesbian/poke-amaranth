	db DEX_NIDORINO ; pokedex id

	db  60,  75,  65,  65,  55
	;   hp  atk  def  spd  spc

	db NORMAL, POISON ; type
	db CR_NORMAL ; catch rate
	db EXP_YIELD_NORMAL ; base exp

	INCBIN "gfx/pokemon/front/nidorino.pic", 0, 1 ; sprite dimensions
	dw NidorinoPicFront, NidorinoPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm TOXIC,           BODY_SLAM,    TAKE_DOWN,      \
	     BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     RAGE,         \
	     THUNDERBOLT,  THUNDER,      MIMIC,          REFLECT,      \
	     BIDE,         SKULL_BASH,   REST,         SUBSTITUTE
	; end

	db BANK(NidorinoPicFront)
	assert BANK(NidorinoPicFront) == BANK(NidorinoPicBack)
