	db DEX_VULPIX ; pokedex id

	db  40,  45,  40,  65,  65
	;   hp  atk  def  spd  spc

	db FIRE, FAIRY ; type
	db CR_EASY ; catch rate
	db EXP_YIELD_LOW ; base exp

	INCBIN "gfx/pokemon/front/vulpix.pic", 0, 1 ; sprite dimensions
	dw VulpixPicFront, VulpixPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm	SWORDS_DANCE, TELEPORT,     DOUBLE_KICK, AGILITY, CRUNCH,      \
			SOLARBEAM,    FOCUS_ENERGY, DIG,         MIMIC,   DOUBLE_DASH, \
			BIDE,         FLAMETHROWER, FLARE_RUSH,  SWIFT,   SKULL_BASH,  \
			REST,         MOONBLAST,    SUBSTITUTE,                        \
			STRENGTH,                                         FLASH
	; end

	db BANK(VulpixPicFront)
	assert BANK(VulpixPicFront) == BANK(VulpixPicBack)
