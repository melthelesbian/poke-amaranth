; Original proof-of-concept code by Yenatch.
; Expanded by Luna to work more like Gen 2, and to fix a bug with Cut requiring the wrong badge.
; Additional comments added by Luna to clarify existing yenatch code and new Luna code for Red++.
; Edited further for RedGold/BlueSilver to check for all the Johto related stuff.
; Edited further for Amaranth to undo the johto stuff and modernize labels/references

TryFieldMove:: ; predef
	call GetPredefRegisters

.Main:
	call TrySurf
	ret z
	call TryCut
	ret

TrySurf:
; Check if you are already surfing, and don't do anything if you are.
	ld a, [wWalkBikeSurfState]
	cp 2
	jr z, .no

; Check to make sure you are facing a surfable tile.
	call IsSurfTile
	jr nc, .no

; Check to make sure you aren't on top of a cliff or something.
	ld hl, TilePairCollisionsWater
	call CheckForTilePairCollisions2
	jr c, .no

; Check for a Pokemon in the party with SURF, and for the proper badge to use it.
	ld d, SURF
	call HasPartyMove
	jr nz, .no

	ld a, [wObtainedBadges]
	bit BIT_SOULBADGE, a
	jr z, .no

; Are we allowed to surf here?
	call TryFieldMove_PrepareText
	farcall IsSurfingAllowed
	ld hl, wStatusFlags1
	bit BIT_SURF_ALLOWED, [hl]
	res BIT_SURF_ALLOWED, [hl]
	jr z, .no2

; Display "The water is calm. Do you want to SURF?" prompt like Gen 2 does.
	ld hl, WaterIsCalmTxt
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .no2

; Call the Surf routine if you said yes.
	call GetPartyMonName2
	ld a, SURFBOARD
	ld [wCurItem], a
	ld [wPseudoItemID], a
	call UseItem
	call TryFieldMove_TextDone

.yes
	xor a
	ret

.no2
	call TryFieldMove_TextDone
.no
	ld a, 1
	and a
	ret

TryCut: ; yenatch's code originally checked for the SOUL_BADGE like SURF does by mistake.
	call IsCutTile
	jr nc, .no

	; Prints the "This tree can be cut!" message, whether you can CUT yet or not.
	call TryFieldMove_PrepareText
	ld hl, CanBeCutTxt
	call PrintText
	call ManualTextScroll

	; Makes sure you have a Pokemon with CUT and have the proper badge.
	ld d, CUT
	call HasPartyMove
	jr nz, .no2

	ld a, [wObtainedBadges]
	bit BIT_CASCADEBADGE, a
	jr z, .no2

	; Asks the player if they want to use CUT, the way Gen 2 does.
	ld hl, WantToCutTxt
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .no2

	; Calls the CUT routine if they said Yes.
	call GetPartyMonName2
	farcall UsedCut2
	call TryFieldMove_TextDone

.yes
	xor a
	ret

.no2
	call TryFieldMove_TextDone
.no
	ld a, 1
	and a
	ret

IsSurfTile:
	ld a, [wCurMapTileset]
	ld hl, WaterTilesets2
	ld de, 1
	call IsInArray
	jr nc, .no

	ld a, [wCurMapTileset]
	cp SHIP_PORT
	ld a, [wTileInFrontOfPlayer]
	jr z, .ok
	cp $48 ; east shore (safari zone)
	jr z, .yes
	cp $32 ; east shore
	jr z, .yes
.ok
	cp $14 ; water
	jr z, .yes
.no
	and a
	ret
.yes
	scf
	ret

; tilesets with water
; originally contained DOJO but that tileset does not exist in Red++
; just make sure this has all tilesets you want to surf in listed
WaterTilesets2: ; Renamed from what Yenatch called it, since that had overlap errors
	db OVERWORLD
	db FOREST
	db GYM
	db SHIP
	db SHIP_PORT
	db CAVERN
	db FACILITY
	db PLATEAU
	db -1

IsCutTile:
	ld a, [wCurMapTileset]
	and a ; OVERWORLD
	jr z, .overworld

	cp GYM
	jr z, .gym

	jr .no

.gym
	ld a, [wTileInFrontOfPlayer]
	cp $50 ; gym cut tree
	jr z, .yes
	jr .no

.overworld
	ld a, [wTileInFrontOfPlayer]
	cp $3d ; cut tree
	jr z, .yes
	jr .no

.no
	and a
	ret
.yes
	scf
	ret


HasPartyMove::
; Return z (optional: in wWhichTrade) if a PartyMon has move d.
; Updates wWhichPokemon.

	push bc
	push de
	push hl

	ld a, [wPartyCount]
	and a
	jr z, .no
	ld b, a
	ld c, 0
	ld hl, wPartyMons + (wPartyMon1Moves - wPartyMon1)
.loop
	ld e, NUM_MOVES
.check_move
	ld a, [hli]
	cp d
	jr z, .yes
	dec e
	jr nz, .check_move

	ld a, wPartyMon2 - wPartyMon1 - NUM_MOVES
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a

	inc c
	ld a, c
	cp b
	jr c, .loop
	jr .no

.yes
	ld a, c
	ld [wWhichPokemon], a
	xor a ; probably redundant
	ld [wWhichTrade], a
	jr .done
.no
	ld a, 1
	and a
	ld [wWhichTrade], a
.done
	pop hl
	pop de
	pop bc
	ret


TryFieldMove_PrepareText:
; Gets everything setup to let you display text properly
	call EnableAutoTextBoxDrawing
	ld a, 1 ; not 0
	ldh [hSpriteIndexOrTextID], a
	farcall DisplayTextIDInit
	ret

TryFieldMove_TextDone:
; Closes the text out properly to prevent glitches
	ldh a, [hLoadedROMBank]
	push af
	jp CloseTextDisplay

CanBeCutTxt:
	text "This tree can be"
	line "CUT!"
	done

WantToCutTxt:
	text "Would you like to"
	line "use CUT?"
	done

WaterIsCalmTxt:
	text "The water is calm."
	line "Would you like to"
	cont "use SURF?"
	done
