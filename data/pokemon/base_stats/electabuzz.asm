	db DEX_ELECTABUZZ ; pokedex id

	db  65,  83,  57, 105,  85
	;   hp  atk  def  spd  spc

	db ELECTRIC, ELECTRIC ; type
	db 45 ; catch rate
	db 156 ; base exp

	INCBIN "gfx/pokemon/front/electabuzz.pic", 0, 1 ; sprite dimensions
	dw ElectabuzzPicFront, ElectabuzzPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,       TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	       HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     RAGE,         THUNDERBOLT,  THUNDER,      PSYCHIC_M,    TELEPORT,     \
	     MIMIC,          REFLECT,      BIDE,         METRONOME,    \
	     SWIFT,        SKULL_BASH,   REST,         THUNDER_WAVE, PSYWAVE,      \
	     SUBSTITUTE,   STRENGTH,     FLASH
	; end

	db 0 ; padding
