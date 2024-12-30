TypeNames:
	table_width 2, TypeNames

	dw .Normal
	dw .Fighting
	dw .Flying
	dw .Poison
	dw .Ground
	dw .Rock
	dw .Steel
	dw .Bug
	dw .Dark
	dw .Dragon

REPT UNUSED_TYPES_END - UNUSED_TYPES
	dw .Normal
ENDR

	dw .Fire
	dw .Water
	dw .Grass
	dw .Electric
	dw .Psychic
	dw .Ice
	dw .Ghost
	dw .Fairy
	dw .Mystery

	assert_table_length NUM_TYPES

.Normal:   db "NORMAL@"
.Fighting: db "FIGHTING@"
.Flying:   db "FLYING@"
.Poison:   db "POISON@"
.Ground:   db "GROUND@"
.Rock:     db "ROCK@"
.Steel:    db "STEEL@"
.Bug:      db "BUG@"
.Dark:     db "DARK@"
.Dragon:   db "DRAGON@"
.Fire:     db "FIRE@"
.Water:    db "WATER@"
.Grass:    db "GRASS@"
.Electric: db "ELECTRIC@"
.Psychic:  db "PSYCHIC@"
.Ice:      db "ICE@"
.Ghost:    db "GHOST@"
.Fairy:    db "FAIRY@"
.Mystery:  db "MYSTERY@"

