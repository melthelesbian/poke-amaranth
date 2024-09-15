    object_const_def
    const_export ROUTE14FAIRYCAVE_SWEETHEART

Route14FairyCave_Object:
    db $3 ; border block

    def_warp_events
	warp_event  6,  7, LAST_MAP, 1
	warp_event  7,  7, LAST_MAP, 1

    def_bg_events

    def_object_events
	object_event 10,  1, SPRITE_FAIRY_GIRL, STAY, NONE, TEXT_ROUTE14FAIRYCAVE_SWEETHEART, OPP_SWEETHEART, 1

    def_warps_to ROUTE_14_FAIRY_CAVE
