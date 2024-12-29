	db DEX_CHARMELEON ; pokedex id

	db  55,  60,  55,  80,  75
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/charmeleon.pic", 0, 1 ; sprite dimensions
	dw CharmeleonPicFront, CharmeleonPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   SWORDS_DANCE,     TOXIC,        BODY_SLAM,    \
	     TAKE_DOWN,    FLARE_RUSH,  SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     RAGE,         DRAGON_RAGE,  DIG,          MIMIC,          \
	     REFLECT,      BIDE,         FIRE_BLAST,   SWIFT,        SKULL_BASH,   \
	     REST,         SUBSTITUTE,   CUT,          STRENGTH
	; end

	db BANK(CharmeleonPicFront)
	assert BANK(CharmeleonPicFront) == BANK(CharmeleonPicBack)
