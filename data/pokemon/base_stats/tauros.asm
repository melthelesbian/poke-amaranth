	db DEX_TAUROS ; pokedex id

	db  75, 110, 105, 110,  70
	;   hp  atk  def  spd  spc

	db NORMAL, NORMAL ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/tauros.pic", 0, 1 ; sprite dimensions
	dw TaurosPicFront, TaurosPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm	HEADBUTT,    DOUBLE_KICK, THUNDER_WAVE, HYPER_BEAM,  AGILITY, \
			SUBMISSION,  EARTHQUAKE,  FOCUS_ENERGY, DOUBLE_DASH, BIDE,    \
			FLARE_RUSH,  SWIFT,       SKULL_BASH,   REST,        PAY_DAY, \
			HEAVY_SMASH, SUBSTITUTE,                                      \
			                                        STRENGTH
	; end

	db BANK(TaurosPicFront)
	assert BANK(TaurosPicFront) == BANK(TaurosPicBack)
