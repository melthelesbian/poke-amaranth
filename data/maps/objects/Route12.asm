	object_const_def
	const_export ROUTE12_SNORLAX
	const_export ROUTE12_FISHER1
	const_export ROUTE12_FISHER2
	const_export ROUTE12_COOLTRAINER_M
	const_export ROUTE12_SUPER_NERD
	const_export ROUTE12_FISHER3
	const_export ROUTE12_FISHER4
	const_export ROUTE12_FISHER5
	const_export ROUTE12_TM_PAY_DAY
	const_export ROUTE12_IRON

Route12_Object:
	db $43 ; border block

	def_warp_events
	warp_event 10, 15, ROUTE_12_GATE_1F, 1
	warp_event 11, 15, ROUTE_12_GATE_1F, 2
	warp_event 10, 21, ROUTE_12_GATE_1F, 3
	warp_event 11, 77, ROUTE_12_FISHING_GURU_HOUSE, 1
	warp_event  6, 85, ROUTE_12_FOSSIL_CAVE, 1

	def_bg_events
	bg_event 13, 13, TEXT_ROUTE12_SIGN
	bg_event 11, 63, TEXT_ROUTE12_SPORT_FISHING_SIGN

	def_object_events
	object_event 10, 62, SPRITE_SNORLAX, STAY, DOWN, TEXT_ROUTE12_SNORLAX
	object_event 14, 31, SPRITE_FISHER, STAY, LEFT, TEXT_ROUTE12_FISHER1, OPP_FISHER, 3
	object_event  5, 39, SPRITE_FISHER, STAY, UP, TEXT_ROUTE12_FISHER2, OPP_FISHER, 4
	object_event 11, 92, SPRITE_COOLTRAINER_M, STAY, LEFT, TEXT_ROUTE12_COOLTRAINER_M, OPP_JR_TRAINER_M, 9
	object_event 14, 76, SPRITE_SUPER_NERD, STAY, RIGHT, TEXT_ROUTE12_SUPER_NERD, OPP_ROCKER, 2
	object_event 12, 40, SPRITE_FISHER, STAY, LEFT, TEXT_ROUTE12_FISHER3, OPP_FISHER, 5
	object_event  9, 52, SPRITE_FISHER, STAY, RIGHT, TEXT_ROUTE12_FISHER4, OPP_FISHER, 6
	object_event  4, 87, SPRITE_FISHER, STAY, DOWN, TEXT_ROUTE12_FISHER5, OPP_FISHER, 11
	object_event 14, 35, SPRITE_POKE_BALL, STAY, NONE, TEXT_ROUTE12_TM_PAY_DAY, TM_PAY_DAY
	object_event  5, 89, SPRITE_POKE_BALL, STAY, NONE, TEXT_ROUTE12_IRON, IRON

	def_warps_to ROUTE_12
