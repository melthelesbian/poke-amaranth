	db DEX_MEWTWO ; pokedex id

	db 105, 110,  90, 130, 125
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db CR_CHALLENGING ; catch rate
	db EXP_YIELD_VERY_HIGH ; base exp

	INCBIN "gfx/pokemon/front/mewtwo.pic", 0, 1 ; sprite dimensions
	dw MewtwoPicFront, MewtwoPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,       TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	       BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   PAY_DAY,      SUBMISSION,   COUNTER,      SEISMIC_TOSS, \
	     RAGE,         SOLARBEAM,    THUNDERBOLT,  THUNDER,      PSYCHIC_M,    \
	     TELEPORT,     MIMIC,        DOUBLE_DASH,  REFLECT,      BIDE,         \
	     METRONOME,    SELFDESTRUCT, FIRE_BLAST,   SKULL_BASH,   REST,         \
	     THUNDER_WAVE, PSYWAVE,      TRI_ATTACK,   SUBSTITUTE,   STRENGTH,     \
	     FLASH
	; end

	db BANK(MewtwoPicFront)
	assert BANK(MewtwoPicFront) == BANK(MewtwoPicBack)
