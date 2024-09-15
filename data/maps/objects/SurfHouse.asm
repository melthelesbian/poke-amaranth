	object_const_def
    const_export SURFING_DUDE

SurfHouse_Object:
	db $a ; border block

	def_warp_events
    warp_event 2, 7, LAST_MAP, 1
    warp_event 3, 7, LAST_MAP, 1

	def_bg_events

	def_object_events
    object_event 3, 5, SPRITE_BIKE_SHOP_CLERK, STAY, NONE, TEXT_SURFING_DUDE

	def_warps_to SURF_HOUSE
