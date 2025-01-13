	db DEX_NIDORAN_F ; pokedex id

	db  55,  50,  55,  45,  40
	;   hp  atk  def  spd  spc

	db NORMAL, GROUND ; type
	db CR_VERY_EASY ; catch rate
	db EXP_YIELD_VERY_LOW ; base exp

	INCBIN "gfx/pokemon/front/nidoranf.pic", 0, 1 ; sprite dimensions
	dw NidoranFPicFront, NidoranFPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, HEADBUTT,    DOUBLE_KICK, EARTHQUAKE, FOCUS_ENERGY, \
			DIG,          DOUBLE_DASH, BIDE,        SWIFT,      REST,         \
			MOONBLAST,    ROCK_SLIDE,  SUBSTITUTE,                            \
			                           SURF
	; end

	db BANK(NidoranFPicFront)
	assert BANK(NidoranFPicFront) == BANK(NidoranFPicBack)
