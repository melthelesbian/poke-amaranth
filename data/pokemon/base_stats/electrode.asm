	db DEX_ELECTRODE ; pokedex id

	db  60,  50,  70, 150,  80
	;   hp  atk  def  spd  spc

	db ELECTRIC, STEEL ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/electrode.pic", 0, 1 ; sprite dimensions
	dw ElectrodePicFront, ElectrodePicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	HEADBUTT,   TELEPORT,    THUNDER_WAVE, HYPER_BEAM,  AGILITY,    \
			SOLARBEAM,  THUNDERBOLT, FOCUS_ENERGY, DOUBLE_DASH, BIDE,       \
			FLARE_RUSH, SWIFT,       SKULL_BASH,   HEAVY_SMASH, SUBSTITUTE, \
			CUT,                                   STRENGTH,    FLASH
	; end

	db BANK(ElectrodePicFront)
	assert BANK(ElectrodePicFront) == BANK(ElectrodePicBack)
