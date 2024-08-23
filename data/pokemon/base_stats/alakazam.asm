	db DEX_ALAKAZAM ; pokedex id

	db  55,  50,  45, 120, 135
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db CR_VERY_HARD ; catch rate
	db 186 ; base exp

	INCBIN "gfx/pokemon/front/alakazam.pic", 0, 1 ; sprite dimensions
	dw AlakazamPicFront, AlakazamPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm        MEGA_PUNCH,   TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	            HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	            RAGE,         DIG,          PSYCHIC_M,    TELEPORT,     MIMIC,        \
	            REFLECT,      BIDE,         METRONOME,    SKULL_BASH,   \
	            REST,         THUNDER_WAVE, PSYWAVE,      TRI_ATTACK,   SUBSTITUTE,   \
	            FLASH
	; end

	db 0 ; padding
