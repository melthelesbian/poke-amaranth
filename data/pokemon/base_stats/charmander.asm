	db DEX_CHARMANDER ; pokedex id

	db  39,  52,  43,  65,  50
	;   hp  atk  def  spd  spc

	db FIRE, FIRE ; type
	db CR_NORMAL ; catch rate
	db 65 ; base exp

	INCBIN "gfx/pokemon/front/charmander.pic", 0, 1 ; sprite dimensions
	dw CharmanderPicFront, CharmanderPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   SWORDS_DANCE,     TOXIC,        BODY_SLAM,    \
	     TAKE_DOWN,    FLARE_RUSH,  SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     RAGE,         DRAGON_RAGE,  DIG,          MIMIC,          \
	     REFLECT,      BIDE,         FIRE_BLAST,   SWIFT,        SKULL_BASH,   \
	     REST,         SUBSTITUTE,   CUT,          STRENGTH
	; end

	db 0 ; padding
