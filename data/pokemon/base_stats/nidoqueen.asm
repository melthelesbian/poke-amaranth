	db DEX_NIDOQUEEN ; pokedex id

	db  90,  95,  85,  75,  80
	;   hp  atk  def  spd  spc

	db FAIRY, GROUND ; type
	db CR_VERY_HARD ; catch rate
	db EXP_YIELD_VERY_HIGH ; base exp

	INCBIN "gfx/pokemon/front/nidoqueen.pic", 0, 1 ; sprite dimensions
	dw NidoqueenPicFront, NidoqueenPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH,   SWORDS_DANCE, HEADBUTT,    FIRE_PUNCH,   ICE_PUNCH,  \
			THUNDERPUNCH, DOUBLE_KICK,  HYPER_BEAM,  DRAGONBREATH, EARTHQUAKE, \
			FOCUS_ENERGY, DIG,          DOUBLE_DASH, BIDE,         SWIFT,      \
			SKULL_BASH,   REST,         MOONBLAST,   HEAVY_SMASH,  ROCK_SLIDE, \
			SUBSTITUTE,                                                        \
			                            SURF,        STRENGTH
	; end

	db BANK(NidoqueenPicFront)
	assert BANK(NidoqueenPicFront) == BANK(NidoqueenPicBack)
