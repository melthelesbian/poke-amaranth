	db DEX_JYNX ; pokedex id

	db  65,  80,  35,  75,  95
	;   hp  atk  def  spd  spc

	db ICE, PSYCHIC_TYPE ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/jynx.pic", 0, 1 ; sprite dimensions
	dw JynxPicFront, JynxPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	MEGA_PUNCH,   FIRE_PUNCH,   ICE_PUNCH, THUNDERPUNCH, ICE_BEAM,   \
			HYPER_BEAM,   LIGHT_SCREEN, REFLECT,   FOCUS_ENERGY, PSYCHIC_M,  \
			PSYWAVE,      MIMIC,        BIDE,      REST,         PAY_DAY,    \
			SUBSTITUTE,                                                      \
			                                       STRENGTH,     FLASH
	; end

	db BANK(JynxPicFront)
	assert BANK(JynxPicFront) == BANK(JynxPicBack)
