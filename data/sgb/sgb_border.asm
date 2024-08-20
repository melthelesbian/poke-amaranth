BorderPalettes:
IF DEF(_AMARANTH)
	INCBIN "gfx/sgb/amaranth_border.tilemap"
ENDC
IF DEF(_RED)
	INCBIN "gfx/sgb/red_border.tilemap"
ENDC
IF DEF(_BLUE)
	INCBIN "gfx/sgb/blue_border.tilemap"
ENDC

	ds $100

; [TODO) credit file or add to end game credits
; credit shinpokered for crediting Dracrius/pocketrgb-en/commit/b7750e2ded2b8acd0b507c7358057591d4c0351b
; for correct values for green sgb border
IF DEF(_AMARANTH)
	RGB 30,29,29 ; PAL_SGB1
	RGB 18,00,25
	RGB 12,00,18
	RGB 09,00,12
ENDC
IF DEF(_RED)
	RGB 30,29,29 ; PAL_SGB1
	RGB 25,22,25
	RGB 25,17,21
	RGB 24,14,12
ENDC
IF DEF(_BLUE)
	RGB 0,0,0 ; PAL_SGB1 (the first color is not defined, but if used, turns up as 30,29,29... o_O)
	RGB 10,17,26
	RGB 5,9,20
	RGB 16,20,27
ENDC

	ds $18

IF DEF(_AMARANTH)
	RGB 30,29,29 ; PAL_SGB2
	RGB 15,18,27
	RGB 24,19,7
	RGB 15,15,15
ENDC
IF DEF(_RED)
	RGB 30,29,29 ; PAL_SGB2
	RGB 22,31,16
	RGB 27,20,6
	RGB 15,15,15
ENDC
IF DEF(_BLUE)
	RGB 30,29,29 ; PAL_SGB2
	RGB 27,11,6
	RGB 5,9,20
	RGB 28,25,15
ENDC

	ds $18

IF DEF(_AMARANTH)
	RGB 30,29,29 ; PAL_SGB3
	RGB 30,27,4
	RGB 29,18,20
	RGB 13,15,16
ENDC
IF DEF(_RED)
	RGB 30,29,29 ; PAL_SGB3
	RGB 31,31,17
	RGB 18,21,29
	RGB 15,15,15
ENDC
IF DEF(_BLUE)
	RGB 30,29,29 ; PAL_SGB3
	RGB 12,15,11
	RGB 5,9,20
	RGB 14,22,17
ENDC

	ds $18

SGBBorderGraphics:
IF DEF(_AMARANTH)
	INCBIN "gfx/sgb/amaranth_border.2bpp"
ENDC
IF DEF(_RED)
	INCBIN "gfx/sgb/red_border.2bpp"
ENDC
IF DEF(_BLUE)
	INCBIN "gfx/sgb/blue_border.2bpp"
ENDC
