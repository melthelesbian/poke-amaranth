	db DEX_ABRA ; pokedex id

	db  25,  20,  15,  90, 105
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db CR_VERY_EASY ; catch rate
	db 73 ; base exp

	INCBIN "gfx/pokemon/front/abra.pic", 0, 1 ; sprite dimensions
	dw AbraPicFront, AbraPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,    TOXIC,        BODY_SLAM,     TAKE_DOWN,    \
	     SUBMISSION,    COUNTER,      SEISMIC_TOSS,  RAGE,         \
	     PSYCHIC_M,     TELEPORT,     MIMIC,         REFLECT,      \
	     BIDE,          METRONOME,    SKULL_BASH,    REST,         THUNDER_WAVE, \
	     PSYWAVE,       TRI_ATTACK,   SUBSTITUTE,    FLASH
	; end

	db BANK(AbraPicFront)
	assert BANK(AbraPicFront) == BANK(AbraPicBack)
