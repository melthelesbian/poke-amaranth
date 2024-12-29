	db DEX_MR_MIME ; pokedex id

	db  50,  45,  65,  90, 120
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, FAIRY ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/mr.mime.pic", 0, 1 ; sprite dimensions
	dw MrMimePicFront, MrMimePicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,       TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	       HYPER_BEAM,   SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     RAGE,         SOLARBEAM,    THUNDERBOLT,  THUNDER,      PSYCHIC_M,    \
	     TELEPORT,     MIMIC,        DOUBLE_DASH,  REFLECT,      BIDE,         \
	     METRONOME,    SKULL_BASH,   REST,         THUNDER_WAVE, PSYWAVE,      \
	     SUBSTITUTE,   FLASH
	; end

	db BANK(MrMimePicFront)
	assert BANK(MrMimePicFront) == BANK(MrMimePicBack)
