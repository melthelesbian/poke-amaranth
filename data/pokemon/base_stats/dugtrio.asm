	db DEX_DUGTRIO ; pokedex id

	db  35, 100,  50, 120,  70
	;   hp  atk  def  spd  spc

	db GROUND, GROUND ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/dugtrio.pic", 0, 1 ; sprite dimensions
	dw DugtrioPicFront, DugtrioPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, HEADBUTT,     TELEPORT,   HYPER_BEAM,  AGILITY,    \
			EARTHQUAKE,   FOCUS_ENERGY, DIG,        DOUBLE_DASH, BIDE,       \
			SWIFT,        SKULL_BASH,   ROCK_SLIDE, TWIN_SLICE,    SUBSTITUTE, \
			CUT,                                    STRENGTH
	; end

	db BANK(DugtrioPicFront)
	assert BANK(DugtrioPicFront) == BANK(DugtrioPicBack)
