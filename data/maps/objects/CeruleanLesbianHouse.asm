	object_const_def
	const_export CERULEANLESBIANHOUSE_BEAUTY
	const_export CERULEANLESBIANHOUSE_BRUNETTE_GIRL

CeruleanLesbianHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 2
	warp_event  3,  7, LAST_MAP, 2

	def_bg_events

	def_object_events
	object_event  5,  4, SPRITE_BEAUTY, STAY, LEFT, TEXT_CERULEANLESBIANHOUSE_BEAUTY
	object_event  1,  2, SPRITE_BRUNETTE_GIRL, WALK, ANY_DIR, TEXT_CERULEANLESBIANHOUSE_BRUNETTE_GIRL

	def_warps_to CERULEAN_LESBIAN_HOUSE
