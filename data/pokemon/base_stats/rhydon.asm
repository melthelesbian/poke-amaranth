	db DEX_RHYDON ; pokedex id

	db 115, 140, 130,  40,  55
	;   hp  atk  def  spd  spc

	db ROCK, STEEL ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/rhydon.pic", 0, 1 ; sprite dimensions
	dw RhydonPicFront, RhydonPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH,  HEADBUTT,   FIRE_PUNCH,  ICE_PUNCH,   THUNDERPUNCH, \
			DOUBLE_KICK, HYPER_BEAM, CRUNCH,      EARTHQUAKE,  BIDE,         \
			SKULL_BASH,  REST,       HEAVY_SMASH, ROCK_SLIDE,  SUBSTITUTE,   \
			                                      STRENGTH
	; end

	db BANK(RhydonPicFront)
	assert BANK(RhydonPicFront) == BANK(RhydonPicBack)
