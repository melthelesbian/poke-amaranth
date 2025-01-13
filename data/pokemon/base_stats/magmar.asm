	db DEX_MAGMAR ; pokedex id

	db  70,  95,  50,  95, 100
	;   hp  atk  def  spd  spc

	db FIRE, FIGHTING ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/magmar.pic", 0, 1 ; sprite dimensions
	dw MagmarPicFront, MagmarPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH, HEADBUTT,     TOXIC,      FIRE_PUNCH,   DOUBLE_KICK, \
			HYPER_BEAM, AGILITY,      SUBMISSION, FOCUS_ENERGY, MIMIC,       \
			BIDE,       FLAMETHROWER, SLUDGE,     FLARE_RUSH,   SWIFT,       \
			SKULL_BASH, REST,         ROCK_SLIDE, SUBSTITUTE,                \
			                                      STRENGTH
	; end

	db BANK(MagmarPicFront)
	assert BANK(MagmarPicFront) == BANK(MagmarPicBack)
