	db DEX_PORYGON ; pokedex id

	db  85,  80,  90,  60, 105
	;   hp  atk  def  spd  spc

	db NORMAL, MYSTERY ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/porygon.pic", 0, 1 ; sprite dimensions
	dw PorygonPicFront, PorygonPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	RAZOR_WIND,   SWORDS_DANCE, HEADBUTT,     TELEPORT,     TOXIC,      \
			ICE_BEAM,     THUNDER_WAVE, HYPER_BEAM,   LIGHT_SCREEN, REFLECT,    \
			AGILITY,      SUBMISSION,   CRUNCH,       MEGA_DRAIN,   SOLARBEAM,  \
			DRAGONBREATH, THUNDERBOLT,  FOCUS_ENERGY, DIG,          PSYCHIC_M,  \
			PSYWAVE,      MIMIC,        DOUBLE_DASH,  SHADOW_TEAR,  BIDE,       \
			FLAMETHROWER, BUG_BUZZ,     FLARE_RUSH,   SWIFT,        SKULL_BASH, \
			HYPNOSIS,     DREAM_EATER,  REST,         MOONBLAST,    PAY_DAY,    \
			HEAVY_SMASH,  SUBSTITUTE,   METRONOME,                              \
			              FLY,          SURF,         FLASH
	; end

	db BANK(PorygonPicFront)
	assert BANK(PorygonPicFront) == BANK(PorygonPicBack)
