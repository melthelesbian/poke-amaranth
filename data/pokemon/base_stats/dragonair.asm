	db DEX_DRAGONAIR ; pokedex id

	db  60,  85,  65,  70,  70
	;   hp  atk  def  spd  spc

	db DRAGON, DRAGON ; type
	db CR_HARD ; catch rate
	db EXP_YIELD_HIGH ; base exp

	INCBIN "gfx/pokemon/front/dragonair.pic", 0, 1 ; sprite dimensions
	dw DragonairPicFront, DragonairPicBack

	db NO_MOVE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm	HEADBUTT,     BUBBLEBEAM,   ICE_BEAM,     THUNDER_WAVE, LIGHT_SCREEN, \
			REFLECT,      AGILITY,      DRAGONBREATH, THUNDERBOLT,  WATERFALL,    \
			FOCUS_ENERGY, DOUBLE_DASH,  BIDE,         FLAMETHROWER, SWIFT,        \
			SKULL_BASH,   REST,         MOONBLAST,    SUBSTITUTE,                 \
			                            SURF,         STRENGTH,     FLASH
	; end

	db BANK(DragonairPicFront)
	assert BANK(DragonairPicFront) == BANK(DragonairPicBack)
