SetDebugNewGameParty: ; unreferenced except in _DEBUG
	ld de, DebugNewGameParty
.loop
	ld a, [de]
	cp -1
	ret z
	ld [wCurPartySpecies], a
	inc de
	ld a, [de]
	ld [wCurEnemyLevel], a
	inc de
	call AddPartyMon
	jr .loop

DebugNewGameParty: ; unreferenced except in _DEBUG
	; Exeggutor is the only debug party member shared with Red, Green, and Japanese Blue.
	; "Tsunekazu Ishihara: Exeggutor is my favorite. That's because I was
	; always using this character while I was debugging the program."
	; From https://web.archive.org/web/20000607152840/http://pocket.ign.com/news/14973.html
	db EXEGGUTOR, 90
IF DEF(_DEBUG)
	db MEW, 5
ELSE
	db MEW, 20
ENDC
	db JOLTEON, 56
	db DUGTRIO, 56
	db ARTICUNO, 57
IF DEF(_DEBUG)
	db PIKACHU, 5
ENDC
	db -1 ; end

PrepareNewGameDebug: ; dummy except in _DEBUG
IF DEF(_DEBUG)
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a

	; Fly anywhere.
	dec a ; $ff (all bits)
	ld [wTownVisitedFlag], a
	ld [wTownVisitedFlag + 1], a

	; Get all badges except Earth Badge.
	ld a, ~(1 << BIT_EARTHBADGE)
	ld [wObtainedBadges], a

	call SetDebugNewGameParty

	; Exeggutor gets four HM moves.
	ld hl, wPartyMon1Moves
	ld a, FLY
	ld [hli], a
	ld a, CUT
	ld [hli], a
	ld a, SURF
	ld [hli], a
	ld a, STRENGTH
	ld [hl], a
	ld hl, wPartyMon1PP
	ld a, 15
	ld [hli], a
	ld a, 30
	ld [hli], a
	ld a, 15
	ld [hli], a
	ld [hl], a

	; Jolteon gets Thunderbolt.
	ld hl, wPartyMon3Moves + 3
	ld a, THUNDERBOLT
	ld [hl], a
	ld hl, wPartyMon3PP + 3
	ld a, 15
	ld [hl], a

	; Articuno gets Fly.
	ld hl, wPartyMon5Moves
	ld a, FLY
	ld [hl], a
	ld hl, wPartyMon5PP
	ld a, 15
	ld [hl], a

	; Pikachu gets Surf.
	ld hl, wPartyMon6Moves + 2
	ld a, SURF
	ld [hl], a
	ld hl, wPartyMon6PP + 2
	ld a, 15
	ld [hl], a

	; Get some debug items.
	ld hl, wNumBagItems
	ld de, DebugItemsList
.items_loop
	ld a, [de]
	cp -1
	jr z, .items_end
	ld [wCurItem], a
	inc de
	ld a, [de]
	inc de
	ld [wItemQuantity], a
	call AddItemToInventory
	jr .items_loop
.items_end

	; Complete the Pokédex.
	ld hl, wPokedexOwned
	call DebugSetPokedexEntries
	ld hl, wPokedexSeen
	call DebugSetPokedexEntries
	SetEvent EVENT_GOT_POKEDEX

	; Rival chose Squirtle,
	; Player chose Charmander.
	ld hl, wRivalStarter
	ld a, STARTER2
	ld [hli], a
	inc hl ; hl = wPlayerStarter
	ld a, STARTER1
	ld [hl], a

	ret

DebugSetPokedexEntries:
	ld b, wPokedexOwnedEnd - wPokedexOwned - 1
	ld a, %11111111
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ld [hl], %01111111
	ret

DebugItemsList:
	db BICYCLE, 1
	db FULL_RESTORE, 99
	db PANACEA, 99
	db ESCAPE_ROPE, 99
	db RARE_CANDY, 99
	db MASTER_BALL, 99
	db TM_MEGA_PUNCH, 1
	db TM_RAZOR_WIND, 1
	db TM_SWORDS_DANCE, 1
	db TM_HEADBUTT, 1
	db TM_TELEPORT, 1
	db TM_TOXIC, 1
	db TM_FIRE_PUNCH, 1
	db TM_ICE_PUNCH, 1
	db TM_THUNDERPUNCH, 1
	db TM_RAZOR_LEAF, 1
	db TM_BUBBLEBEAM, 1
	db TM_DOUBLE_KICK, 1
	db TM_ICE_BEAM, 1
	db TM_THUNDER_WAVE, 1
	db TM_HYPER_BEAM, 1
	db TM_LIGHT_SCREEN, 1
	db TM_REFLECT, 1
	db TM_AGILITY, 1
	db TM_SUBMISSION, 1
	db TM_CRUNCH, 1
	db TM_MEGA_DRAIN, 1
	db TM_SOLARBEAM, 1
	db TM_DRAGONBREATH, 1
	db TM_THUNDERBOLT, 1
	db TM_WATERFALL, 1
	db TM_EARTHQUAKE, 1
	db TM_FOCUS_ENERGY, 1
	db TM_DIG, 1
	db TM_PSYCHIC_M, 1
	db TM_PSYWAVE, 1
	db TM_MIMIC, 1
	db TM_DOUBLE_DASH, 1
	db TM_SHADOW_TEAR, 1
	db TM_BIDE, 1
	db TM_FLAMETHROWER, 1
	db TM_SLUDGE, 1
	db TM_BUG_BUZZ, 1
	db TM_FLARE_RUSH, 1
	db TM_SWIFT, 1
	db TM_SKULL_BASH, 1
	db TM_HYPNOSIS, 1
	db TM_DREAM_EATER, 1
	db TM_VENOM_STRIKE, 1
	db TM_REST, 1
	db TM_MOONBLAST, 1
	db TM_PAY_DAY, 1
	db TM_HEAVY_SMASH, 1
	db TM_ROCK_SLIDE, 1
	db TM_TWIN_SLICE, 1
	db TM_SUBSTITUTE, 1
	db TM_METRONOME, 1
	db HM_CUT, 1
	db HM_FLY, 1
	db HM_SURF, 1
	db HM_STRENGTH, 1
	db HM_FLASH, 1
	db -1 ; end

DebugUnusedList:
	db -1 ; end
ELSE
	ret
ENDC
