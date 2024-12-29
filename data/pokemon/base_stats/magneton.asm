	db DEX_MAGNETON ; pokedex id

	db  80,  60,  95,  70, 120
	;   hp  atk  def  spd  spc

	db STEEL, ELECTRIC ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/magneton.pic", 0, 1 ; sprite dimensions
	dw MagnetonPicFront, MagnetonPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm TOXIC,        TAKE_DOWN,      HYPER_BEAM,   RAGE,         \
	     THUNDERBOLT,  THUNDER,      TELEPORT,     MIMIC,          \
	     REFLECT,      BIDE,         SWIFT,        REST,         THUNDER_WAVE, \
	     SUBSTITUTE,   FLASH
	; end

	db BANK(MagnetonPicFront)
	assert BANK(MagnetonPicFront) == BANK(MagnetonPicBack)
