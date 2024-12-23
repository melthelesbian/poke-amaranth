HandleItemListSwapping::
	ld a, [wListMenuID]
	cp ITEMLISTMENU
	jp nz, DisplayListMenuIDLoop ; only rearrange item list menus
	push hl
	ld hl, wListPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl ; hl = beginning of list entries
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, [wListScrollOffset]
	add b
	add a
	ld c, a
	ld b, 0
	add hl, bc ; hl = address of currently selected item entry
	ld a, [hl]
	pop hl
	inc a
	jp z, DisplayListMenuIDLoop ; ignore attempts to swap the Cancel menu item
	ld a, [wMenuItemToSwap] ; ID of item chosen for swapping (counts from 1)
	and a ; has the first item to swap already been chosen?
	jr nz, .swapItems
; if not, set the currently selected item as the first item
	ld a, [wCurrentMenuItem]
	inc a
	ld b, a
	ld a, [wListScrollOffset] ; index of top (visible) menu item within the list
	add b
	ld [wMenuItemToSwap], a ; ID of item chosen for swapping (counts from 1)
	ld c, 20
	call DelayFrames
	jp DisplayListMenuIDLoop
.swapItems
	ld a, [wCurrentMenuItem]
	inc a
	ld b, a
	ld a, [wListScrollOffset]
	add b
	ld b, a
	ld a, [wMenuItemToSwap] ; ID of item chosen for swapping (counts from 1)
	cp b ; is the currently selected item the same as the first item to swap?
	jp z, DisplayListMenuIDLoop ; ignore attempts to swap an item with itself
	dec a
	ld [wMenuItemToSwap], a ; ID of item chosen for swapping (counts from 1)
	ld c, 20
	call DelayFrames
	push hl
	push de
	ld hl, wListPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl ; hl = beginning of list entries
	ld d, h
	ld e, l ; de = beginning of list entries
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, [wListScrollOffset]
	add b
	add a
	ld c, a
	ld b, 0
	add hl, bc ; hl = address of currently selected item entry
	ld a, [wMenuItemToSwap] ; ID of item chosen for swapping (counts from 1)
	add a
	add e
	ld e, a
	jr nc, .noCarry
	inc d
.noCarry ; de = address of first item to swap
	ld a, [de]
	ld b, a
	ld a, [hli]
	cp b
	jr z, .swapSameItemType
.swapDifferentItems
	ldh [hSwapItemID], a ; save second item ID
	ld a, [hld]
	ldh [hSwapItemQuantity], a ; save second item quantity
	ld a, [de]
	ld [hli], a ; put first item ID in second item slot
	inc de
	ld a, [de]
	ld [hl], a ; put first item quantity in second item slot
	ldh a, [hSwapItemQuantity]
	ld [de], a ; put second item quantity in first item slot
	dec de
	ldh a, [hSwapItemID]
	ld [de], a ; put second item ID in first item slot
	xor a
	ld [wMenuItemToSwap], a ; 0 means no item is currently being swapped
	pop de
	pop hl
	jp DisplayListMenuIDLoop
.swapSameItemType
	inc de
	ld a, [hl]
	ld b, a
	ld a, [de]
	add b ; a = sum of both item quantities
	cp 100 ; is the sum too big for one item slot?
	jr c, .combineItemSlots
; swap enough items from the first slot to max out the second slot if they can't be combined
	sub 99
	ld [de], a
	ld a, 99
	ld [hl], a
	jr .done
.combineItemSlots
	ld [hl], a ; put the sum in the second item slot
	ld hl, wListPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	dec [hl] ; decrease the number of items
	ld a, [hl]
	ld [wListCount], a ; update number of items variable
	cp 1
	jr nz, .skipSettingMaxMenuItemID
	ld [wMaxMenuItem], a ; if the number of items is only one now, update the max menu item ID
.skipSettingMaxMenuItemID
	dec de
	ld h, d
	ld l, e
	inc hl
	inc hl ; hl = address of item after first item to swap
.moveItemsUpLoop ; erase the first item slot and move up all the following item slots to fill the gap
	ld a, [hli]
	ld [de], a
	inc de
	inc a ; reached the $ff terminator?
	jr z, .afterMovingItemsUp
	ld a, [hli]
	ld [de], a
	inc de
	jr .moveItemsUpLoop
.afterMovingItemsUp
	xor a
	ld [wListScrollOffset], a
	ld [wCurrentMenuItem], a
.done
	xor a
	ld [wMenuItemToSwap], a ; 0 means no item is currently being swapped
	pop de
	pop hl
	jp DisplayListMenuIDLoop

; [INFO] Credit to pokered item sorting tutorial
SortItems::
	push hl
	push bc
	ld hl, SortItemsText ; Display the text to ask to sort
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jp z, .beginSorting ; If yes
	jr .done
.finishedSwapping
	ld a, [hSwapTemp] ; If not 0, then a swap of items did occur
	cp 0
	jr z, .nothingSorted
	ld hl, SortComplete
	jr .printResultText
.nothingSorted
	ld hl, NothingToSort
.printResultText
	call PrintText
.done
	xor a ; Zeroes a
	pop bc
	pop hl
	ret
.beginSorting
	xor a
	ld [hSwapTemp], a ; 1 if something in the bag got sorted
	ld de, 0
	ld hl, ItemSortList
	ld b, [hl] ; This is the first item to check for
	ld hl, wBagItems
	ld c, 0 ; Relative to wBagItems, this is where we'd like to begin swapping
.loopCurrItemInBag
	ld a, [hl] ; Load the value of hl to a (which is an item number) and Increments to the quantity
	cp -1 ; See if the item number is $ff, which is 'cancel'
	jr z, .findNextItem ; If it is cancel, then move onto the next item
	cp b
	jr z, .hasItem ; If it's not b, then go to the next item in the bag
	inc hl ; increments past the quantity to the next item to check
	inc hl
	jr .loopCurrItemInBag
.findNextItem
	ld d, 0
	inc e
	ld hl, ItemSortList
	add hl, de
	ld b, [hl]
	ld hl, wBagItems ; Resets hl to start at the beginning of the bag
	ld a, b
	cp -1 ; Check if we got through all of the items, to the last one
	jr z, .finishedSwapping
	jr .loopCurrItemInBag
.hasItem ; c contains where to swap to relative to the start of wBagItems
		 ; hl contains where the item to swap is absolute.
		 ; b contains the item ID
	push de
	ld d, h
	ld e, l
	ld hl, wBagItems
	ld a, b
	ld b, 0
	add hl, bc ; hl now holds where we'd like to swap to
	ld b, a
	ld a, [de]
	cp [hl]
	jr z, .cont ; If they're the same item
	ld a, 1
	ld [hSwapTemp], a
	ld a, [hl]
	ld [hSwapItemID],a ; [hSwapItemID] = second item ID
	inc hl
	ld a,[hld]
	ld [hSwapItemQuantity],a ; [hSwapItemQuantity] = second item quantity
	ld a,[de]
	ld [hli],a ; put first item ID in second item slot
	inc de
	ld a,[de]
	ld [hl],a ; put first item quantity in second item slot
	ld a,[hSwapItemQuantity]
	ld [de],a ; put second item quantity in first item slot
	dec de
	ld a,[hSwapItemID]
	ld [de],a ; put second item ID in first item slot
.cont
	inc c
	inc c
	ld h, d
	ld l, e
	pop de
	jr .findNextItem

SortItemsText::
	text_far _SortItemsText
	db "@"

SortComplete::
	text_far _SortComplete
	db "@"

NothingToSort::
	text_far _NothingToSort
	db "@"

ItemSortList::
	; Used Key Items
	db BICYCLE
	db SURFBOARD
	db FISHING_ROD
	db ITEMFINDER
	; Balls
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db SAFARI_BALL
	db MASTER_BALL
	; Common Items
	db REPEL
	db ESCAPE_ROPE
	db POKE_DOLL
	; Health
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db MAX_POTION
	db FULL_RESTORE
	db FRESH_WATER
	db ICED_TEA
	db LEMONADE
	; Revival
	db REVIVE
	db MAX_REVIVE
	; Status
	db ANTIDOTE
	db BURN_HEAL
	db ICE_HEAL
	db AWAKENING
	db PARLYZ_HEAL
	db FULL_HEAL
	db POKE_FLUTE
	; PP
	db ETHER
	db MAX_ETHER
	db ELIXIR
	db MAX_ELIXIR
	; Permanent Raises
	db RARE_CANDY
	db HP_UP
	db PROTEIN
	db IRON
	db CARBOS
	db CALCIUM
	db PP_UP
	; EVO Items
	db DEVO_SPRAY
	db LEAF_STONE
	db FIRE_STONE
	db THUNDER_STONE
	db WATER_STONE
	db MOON_STONE
	; Money
	db COIN_CASE
	db COIN
	db NUGGET
	; Fossils
	db DOME_FOSSIL
	db HELIX_FOSSIL
	db OLD_AMBER
	db ANCIENT_HAIR
	; Maps and Items with No Use
	db SAFARI_BAIT
	db SAFARI_ROCK
	; Key Items With No Use
	db EXP_ALL
	db BIKE_VOUCHER
	db CARD_KEY
	db GOLD_TEETH
	db OAKS_PARCEL
	; TMs
	db TM_01
	db TM_02
	db TM_03
	db TM_04
	db TM_05
	db TM_06
	db TM_07
	db TM_08
	db TM_09
	db TM_10
	db TM_11
	db TM_12
	db TM_13
	db TM_14
	db TM_15
	db TM_16
	db TM_17
	db TM_18
	db TM_19
	db TM_20
	db TM_21
	db TM_22
	db TM_23
	db TM_24
	db TM_25
	db TM_26
	db TM_27
	db TM_28
	db TM_29
	db TM_30
	db TM_31
	db TM_32
	db TM_33
	db TM_34
	db TM_35
	db TM_36
	db TM_37
	db TM_38
	db TM_39
	db TM_40
	db TM_41
	db TM_42
	db TM_43
	db TM_44
	db TM_45
	db TM_46
	db TM_47
	db TM_48
	db TM_49
	db TM_50
	; HMs
	db HM_01
	db HM_02
	db HM_03
	db HM_04
	db HM_05
	db -1 ; end
