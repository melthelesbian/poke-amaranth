CeruleanFishingHouse_Script:
	ld a, TRUE
	ld [wAutoTextBoxDrawingControl], a
	dec a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ret

CeruleanFishingHouse_TextPointers:
	def_text_pointers
	dw_const CeruleanFishingHouseFisherText, TEXT_CERULEANFISHINGHOUSE_FISHING_GURU

CeruleanFishingHouseFisherText:
	text_asm
	ld a, [wStatusFlags1]
	bit BIT_GOT_FISHING_ROD, a
	jr nz, .got_item
	ld hl, .DoYouLikeToFishText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	lb bc, FISHING_ROD, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, wStatusFlags1
	set BIT_GOT_FISHING_ROD, [hl]
	ld hl, .ReceivedSuperRodText
	jr .done
.bag_full
	ld hl, .NoRoomText
	jr .done
.refused
	ld hl, .ThatsDisappointingText
	jr .done
.got_item
	ld hl, .TryFishingText
.done
	call PrintText
	jp TextScriptEnd

.DoYouLikeToFishText:
	text_far _CeruleanFishingHouseFishingGuruDoYouLikeToFishText
	text_end

.ReceivedSuperRodText:
	text_far _CeruleanFishingHouseFishingGuruReceivedSuperRodText
	sound_get_item_1
	text_far _CeruleanFishingHouseFishingGuruFishingWayOfLifeText
	text_end

.ThatsDisappointingText:
	text_far _CeruleanFishingHouseFishingGuruThatsDisappointingText
	text_end

.TryFishingText:
	text_far _CeruleanFishingHouseFishingGuruTryFishingText
	text_end

.NoRoomText:
	text_far _CeruleanFishingHouseFishingGuruNoRoomText
	text_end