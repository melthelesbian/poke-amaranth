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
	tmhm TOXIC,           BODY_SLAM,    TAKE_DOWN,      \
	     BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     RAGE,         \
	     DRAGON_RAGE,  THUNDERBOLT,  THUNDER,      MIMIC,        DOUBLE_DASH,  \
	     REFLECT,      BIDE,         FIRE_BLAST,   SWIFT,        SKULL_BASH,   \
	     REST,         THUNDER_WAVE, SUBSTITUTE,   SURF
	; end

	db BANK(DragonairPicFront)
	assert BANK(DragonairPicFront) == BANK(DragonairPicBack)
