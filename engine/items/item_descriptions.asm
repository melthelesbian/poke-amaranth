GetItemDescription:
	ld a, [wCurItem]
	ld [wd11e], a
	dec a
	ld hl, ItemDescriptions
	ld bc, 2
	call AddNTimes
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret

DisplayItemDescription:
	; Draw a text box for the description
	hlcoord 0, 14
	lb bc, 2, 18
	call TextBoxBorder

	; Get and display the item description
	call GetItemDescription
	hlcoord 1, 15
	call PlaceString

	; Wait for button press
	call WaitForTextScrollButtonPress
	call LoadScreenTilesFromBuffer2
	ret
