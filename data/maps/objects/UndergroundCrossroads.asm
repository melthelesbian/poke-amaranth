UndergroundCrossroads_Object:
    db $1 ; border block

	def_warp_events
	warp_event  19,  4, UNDERGROUND_PATH_ROUTE_5, 3
	warp_event  16, 35, UNDERGROUND_PATH_ROUTE_6, 3
    warp_event   2, 21, UNDERGROUND_PATH_ROUTE_7, 3
    warp_event  33, 18, UNDERGROUND_PATH_ROUTE_8, 3

	def_bg_events

	def_object_events

	def_warps_to UNDERGROUND_CROSSROADS