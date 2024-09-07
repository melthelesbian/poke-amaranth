	object_const_def

MtMoonSquare_Object:
	db $2C ; border block

	def_warp_events
	warp_event 24, 11, MT_MOON_B2F, 5
	warp_event 17,  7, MT_MOON_SQUARE_GIFT_SHOP, 1

	def_bg_events
	bg_event 19, 9, TEXT_MTMOONSQUARE_GIFT_SHOP_SIGN

	def_object_events

	def_warps_to MT_MOON_SQUARE