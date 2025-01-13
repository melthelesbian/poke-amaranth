	db DEX_NINETALES ; pokedex id

	db  70,  75,  75, 110, 100
	;   hp  atk  def  spd  spc

	db FIRE, FAIRY ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/ninetales.pic", 0, 1 ; sprite dimensions
	dw NinetalesPicFront, NinetalesPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	RAZOR_WIND,   SWORDS_DANCE, TELEPORT,   DOUBLE_KICK,  HYPER_BEAM, \
			AGILITY,      CRUNCH,       SOLARBEAM,  FOCUS_ENERGY, DIG,        \
			PSYCHIC_M,    PSYWAVE,      MIMIC,      DOUBLE_DASH,  BIDE,       \
			FLAMETHROWER, FLARE_RUSH,   SWIFT,      SKULL_BASH,   HYPNOSIS,   \
			REST,         MOONBLAST,    SUBSTITUTE,                           \
			                                        STRENGTH,     FLASH
	; end

	db BANK(NinetalesPicFront)
	assert BANK(NinetalesPicFront) == BANK(NinetalesPicBack)
