	db DEX_CHARIZARD ; pokedex id

	db  78,  84,  78, 100,  85
	;   hp  atk  def  spd  spc

	db FIRE, DRAGON ; type
	db 45 ; catch rate
	db 209 ; base exp

	INCBIN "gfx/pokemon/front/charizard.pic", 0, 1 ; sprite dimensions
	dw CharizardPicFront, CharizardPicBack

	db SCRATCH, GROWL, EMBER, LEER ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,   SWORDS_DANCE,     TOXIC,        BODY_SLAM,    \
	     TAKE_DOWN,    FLARE_RUSH,  HYPER_BEAM,   SUBMISSION,   COUNTER,      \
	     SEISMIC_TOSS, RAGE,         DRAGON_RAGE,  EARTHQUAKE,   FISSURE,      \
	     DIG,          MIMIC,          REFLECT,      BIDE,         \
	     FIRE_BLAST,   SWIFT,        SKULL_BASH,   REST,         SUBSTITUTE,   \
	     CUT,          FLY,          STRENGTH
	; end

	db 0 ; padding
