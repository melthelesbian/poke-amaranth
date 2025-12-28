	object_const_def
	const_export MOVEMANIACHOUSE_MOVE_MANIAC

MoveManiacHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 3
	warp_event  3,  7, LAST_MAP, 3

	def_bg_events

	def_object_events
	object_event  5,  4, SPRITE_BEAUTY, STAY, LEFT, TEXT_MOVEMANIACHOUSE_MOVE_MANIAC

	def_warps_to MOVE_MANIAC_HOUSE
