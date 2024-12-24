	db DEX_AERODACTYL ; pokedex id

	db  80, 105,  65, 130,  60
	;   hp  atk  def  spd  spc

	db ROCK, FLYING ; type
	db CR_VERY_HARD ; catch rate
	db 202 ; base exp

	INCBIN "gfx/pokemon/front/aerodactyl.pic", 0, 1 ; sprite dimensions
	dw AerodactylPicFront, AerodactylPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm  RAZOR_WIND, TOXIC, TAKE_DOWN, HYPER_BEAM, RAGE, DRAGON_RAGE, \
	      MIMIC, REFLECT, BIDE, FIRE_BLAST, SWIFT, SKY_ATTACK, \
	      REST, SUBSTITUTE, FLY
	; end

	db BANK(AerodactylPicFront)
	assert BANK(AerodactylPicFront) == BANK(AerodactylPicBack)
