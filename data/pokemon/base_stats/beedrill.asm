	db DEX_BEEDRILL ; pokedex id

	db  70,  95,  50,  75,  60
	;   hp  atk  def  spd  spc

	db BUG, POISON ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/beedrill.pic", 0, 1 ; sprite dimensions
	dw BeedrillPicFront, BeedrillPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SWORDS_DANCE, TOXIC,        TAKE_DOWN,      HYPER_BEAM,   \
	     RAGE,         MEGA_DRAIN,   MIMIC,        DOUBLE_DASH,  REFLECT,      \
	     BIDE,         SWIFT,        SKULL_BASH,   REST,         SUBSTITUTE,   \
	     CUT
	; end

	db BANK(BeedrillPicFront)
	assert BANK(BeedrillPicFront) == BANK(BeedrillPicBack)
