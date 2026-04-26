	db DEX_AERODACTYL ; pokedex id

	db  80, 105,  65, 130,  75
	;   hp  atk  def  spd  spc

	db ROCK, FLYING ; type
	db CR_VERY_HARD ; catch rate
	db EXP_YIELD_VERY_HIGH ; base exp

	INCBIN "gfx/pokemon/front/aerodactyl.pic", 0, 1 ; sprite dimensions
	dw AerodactylPicFront, AerodactylPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm	RAZOR_WIND,   HEADBUTT,     HYPER_BEAM, AGILITY,      CRUNCH,     \
			DRAGONBREATH, FOCUS_ENERGY, BIDE,       FLAMETHROWER, SKULL_BASH, \
			REST,         ROCK_SLIDE,   TWIN_SLICE,   SUBSTITUTE,               \
			CUT,          FLY,                      STRENGTH
	; end

	db BANK(AerodactylPicFront)
	assert BANK(AerodactylPicFront) == BANK(AerodactylPicBack)
