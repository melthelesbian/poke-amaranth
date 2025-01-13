	db DEX_EEVEE ; pokedex id

	db  55,  55,  50,  55,  65
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db CR_NORMAL ; catch rate
	db EXP_YIELD_NORMAL ; base exp

	INCBIN "gfx/pokemon/front/eevee.pic", 0, 1 ; sprite dimensions
	dw EeveePicFront, EeveePicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, HEADBUTT, DOUBLE_KICK,  THUNDER_WAVE, HYPER_BEAM, \
			AGILITY,      CRUNCH,   FOCUS_ENERGY, DIG,          MIMIC,      \
			DOUBLE_DASH,  BIDE,     SWIFT,        SKULL_BASH,   REST,       \
			MOONBLAST,    PAY_DAY,  HEAVY_SMASH,  SUBSTITUTE,   METRONOME,  \
			                        SURF,         STRENGTH,     FLASH
	; end

	db BANK(EeveePicFront)
	assert BANK(EeveePicFront) == BANK(EeveePicBack)
