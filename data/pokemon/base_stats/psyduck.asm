	db DEX_PSYDUCK ; pokedex id

	db  50,  50,  50,  55,  65
	;   hp  atk  def  spd  spc

	db WATER, PSYCHIC_TYPE ; type
	db CR_EASY ; catch rate
	db EXP_YIELD_LOW ; base exp

	INCBIN "gfx/pokemon/front/psyduck.pic", 0, 1 ; sprite dimensions
	dw PsyduckPicFront, PsyduckPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,       TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	       BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     \
	     PAY_DAY,      SUBMISSION,   COUNTER,      SEISMIC_TOSS, RAGE,         \
	     DIG,          MIMIC,          BIDE,         SWIFT,        \
	     SKULL_BASH,   REST,         SUBSTITUTE,   SURF,         STRENGTH
	; end

	db BANK(PsyduckPicFront)
	assert BANK(PsyduckPicFront) == BANK(PsyduckPicBack)
