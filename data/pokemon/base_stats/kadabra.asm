	db DEX_KADABRA ; pokedex id

	db  40,  35,  30, 105, 120
	;   hp  atk  def  spd  spc

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db CR_NORMAL ; catch rate
	db EXP_YIELD_NORMAL ; base exp

	INCBIN "gfx/pokemon/front/kadabra.pic", 0, 1 ; sprite dimensions
	dw KadabraPicFront, KadabraPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm 	MEGA_PUNCH, HEADBUTT,  TELEPORT,   THUNDER_WAVE, LIGHT_SCREEN, \
			REFLECT,    PSYCHIC_M, PSYWAVE,    MIMIC,        BIDE,         \
			SWIFT,      REST,      SUBSTITUTE, METRONOME,                  \
			                                                 FLASH
	; end

	db BANK(KadabraPicFront)
	assert BANK(KadabraPicFront) == BANK(KadabraPicBack)
