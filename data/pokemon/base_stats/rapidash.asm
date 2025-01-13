	db DEX_RAPIDASH ; pokedex id

	db  65, 100,  70, 105,  80
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/rapidash.pic", 0, 1 ; sprite dimensions
	dw RapidashPicFront, RapidashPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm 	HEADBUTT,   DOUBLE_KICK,  HYPER_BEAM,  AGILITY,  CRUNCH,       \
			EARTHQUAKE, FOCUS_ENERGY, DOUBLE_DASH, BIDE,     FLAMETHROWER, \
			FLARE_RUSH, SWIFT,        SKULL_BASH,  REST,     HEAVY_SMASH,  \
			ROCK_SLIDE, SUBSTITUTE,                                        \
			                                       STRENGTH, FLASH
	; end

	db BANK(RapidashPicFront)
	assert BANK(RapidashPicFront) == BANK(RapidashPicBack)
