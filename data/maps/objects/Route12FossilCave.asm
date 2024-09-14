    object_const_def
    const_export ROUTE12FOSSILCAVE_FOSSIL

Route12FossilCave_Object:
    db $3 ; border block

    def_warp_events
    warp_event  4,  7, LAST_MAP, 5
    warp_event  5,  7, LAST_MAP, 5

    def_bg_events

    def_object_events
    object_event  5,  2, SPRITE_FOSSIL, STAY, NONE, TEXT_ROUTE12FOSSILCAVE_FOSSIL

    def_warps_to ROUTE_12_FOSSIL_CAVE
