	db DEX_ELECTABUZZ ; pokedex id

	db  75,  95,  70, 75,  95
	;   hp  atk  def  spd  spc

	db ELECTRIC, FIGHTING ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/electabuzz.pic", 0, 1 ; sprite dimensions
	dw ElectabuzzPicFront, ElectabuzzPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH,   FIRE_PUNCH,  ICE_PUNCH,  THUNDERPUNCH, DOUBLE_KICK, \
			THUNDER_WAVE, HYPER_BEAM,  AGILITY,    SUBMISSION,   CRUNCH,      \
			THUNDERBOLT,  EARTHQUAKE,  MIMIC,      BIDE,         SWIFT,       \
			REST,         HEAVY_SMASH, SUBSTITUTE,                            \
			                                       STRENGTH,     FLASH
	; end

	db BANK(ElectabuzzPicFront)
	assert BANK(ElectabuzzPicFront) == BANK(ElectabuzzPicBack)
