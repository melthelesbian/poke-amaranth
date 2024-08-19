	db DEX_CUBONE ; pokedex id

	db  50,  50,  95,  35,  40
	;   hp  atk  def  spd  spc

	db GROUND, GHOST ; type
	db 190 ; catch rate
	db 87 ; base exp

	INCBIN "gfx/pokemon/front/cubone.pic", 0, 1 ; sprite dimensions
	dw CubonePicFront, CubonePicBack

	db BONE_CLUB, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm MEGA_PUNCH,       TOXIC,        BODY_SLAM,    TAKE_DOWN,    \
	       BUBBLEBEAM,   WATER_GUN,    ICE_BEAM,     BLIZZARD,     \
	     SUBMISSION,   COUNTER,      SEISMIC_TOSS, RAGE,         EARTHQUAKE,   \
	     FISSURE,      DIG,          MIMIC,          BIDE,         \
	     FIRE_BLAST,   SKULL_BASH,   REST,         SUBSTITUTE,   STRENGTH
	; end

	db 0 ; padding
