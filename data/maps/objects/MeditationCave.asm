    object_const_def
    const_export MEDITATIONCAVE_TM_HYPER_BEAM

MeditationCave_Object:
    db $3 ; border block

    def_warp_events
    warp_event 10, 23, LAST_MAP, 6
    warp_event 11, 23, LAST_MAP, 6

    def_bg_events

	def_object_events
    object_event 4, 9, SPRITE_POKE_BALL, STAY, NONE, TEXT_MEDITATIONCAVE_TM_HYPER_BEAM, TM_HYPER_BEAM

	def_warps_to MEDITATION_CAVE