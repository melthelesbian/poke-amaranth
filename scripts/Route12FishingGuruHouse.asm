Route12FishingGuruHouse_Script:
	jp EnableAutoTextBoxDrawing

Route12FishingGuruHouse_TextPointers:
	def_text_pointers
	dw_const Route12FishingGuruHouseFishingGuruText, TEXT_ROUTE12SUPERRODHOUSE_FISHING_GURU

Route12FishingGuruHouseFishingGuruText:
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
	ld hl, .ReceivedFishingRodText
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
	text_far _Route12FishingGuruHouseFishingGuruDoYouLikeToFishText
	text_end

.ReceivedFishingRodText:
	text_far _Route12FishingGuruHouseFishingGuruReceivedFishingRodText
	sound_get_item_1
	text_far _Route12FishingGuruHouseFishingGuruFishingWayOfLifeText
	text_end

.ThatsDisappointingText:
	text_far _Route12FishingGuruHouseFishingGuruThatsDisappointingText
	text_end

.TryFishingText:
	text_far _Route12FishingGuruHouseFishingGuruTryFishingText
	text_end

.NoRoomText:
	text_far _Route12FishingGuruHouseFishingGuruNoRoomText
	text_end
