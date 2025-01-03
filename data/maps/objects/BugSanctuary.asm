	object_const_def
	const_export BUGSANCTUARY_GEORGIA
	const_export BUGSANCTUARY_BUGCATCHER1
	const_export BUGSANCTUARY_BUGCATCHER2
	const_export BUGSANCTUARY_LASS
	const_export BUGSANCTUARY_JRTRAINER_F
	const_export BUGSANCTUARY_PINSIR_POKE_BALL
	const_export BUGSANCTUARY_SCYTHER_POKE_BALL

BugSanctuary_Object:
	db $3 ; border block

	def_warp_events
	warp_event 10, 23, LAST_MAP, 10
	warp_event 11, 23, LAST_MAP, 10

	def_bg_events
	bg_event  8, 21, TEXT_BUGSANCTUARY_GYM_SIGN
	bg_event 13, 21, TEXT_BUGSANCTUARY_GYM_SIGN

	def_object_events
	object_event  2,   6, SPRITE_FAIRY_GIRL, STAY, DOWN, TEXT_BUGSANCTUARY_GEORGIA, OPP_SWEETHEART, 2
	object_event  1,  18, SPRITE_YOUNGSTER, STAY, RIGHT, TEXT_BUGSANCTUARY_BUGCATCHER1, OPP_BUG_CATCHER, 15
	object_event  18, 12, SPRITE_YOUNGSTER, STAY, LEFT, TEXT_BUGSANCTUARY_BUGCATCHER2, OPP_BUG_CATCHER, 16
	object_event  13, 14, SPRITE_BRUNETTE_GIRL, STAY, LEFT, TEXT_BUGSANCTUARY_LASS, OPP_LASS, 19
	object_event  10,  8, SPRITE_COOLTRAINER_F, STAY, RIGHT, TEXT_BUGSANCTUARY_JRTRAINER_F, OPP_JR_TRAINER_F, 25
	object_event  1,   3, SPRITE_POKE_BALL, STAY, NONE, TEXT_BUGSANCTUARY_PINSIR_POKE_BALL
	object_event  2,   3, SPRITE_POKE_BALL, STAY, NONE, TEXT_BUGSANCTUARY_SCYTHER_POKE_BALL

	def_warps_to BUG_SANCTUARY