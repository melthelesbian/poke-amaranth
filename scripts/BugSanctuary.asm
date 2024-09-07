BugSanctuary_Script:
	call EnableAutoTextBoxDrawing
	ld hl, BugSanctuaryTrainerHeaders
	ld de, BugSanctuary_ScriptPointers
	ld a, [wBugSanctuaryCurScript]
	call ExecuteCurMapScriptInTable
	ld [wBugSanctuaryCurScript], a
	ret

BugSanctuaryResetScripts:
	xor a ; SCRIPT_FIGHTINGDOJO_DEFAULT
	ld [wJoyIgnore], a
	ld [wBugSanctuaryCurScript], a
	ld [wCurMapScript], a
	ret

BugSanctuary_ScriptPointers:
	def_script_pointers
	dw_const BugSanctuaryDefaultScript,                SCRIPT_BUGSANCTUARY_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle,    SCRIPT_BUGSANCTUARY_START_BATTLE
	dw_const EndTrainerBattle,                         SCRIPT_BUGSANCTUARY_END_BATTLE
	dw_const BugSanctuaryGeorgiaPostBattleScript,      SCRIPT_BUGSANCTUARY_GEORGIA_POST_BATTLE

BugSanctuaryDefaultScript:
	CheckEvent EVENT_DEFEATED_BUG_SANCTUARY
	ret nz
	call CheckFightingMapTrainers
	ld a, [wTrainerHeaderFlagBit]
	and a
	ret nz
	CheckEvent EVENT_BEAT_BUG_SANCTUARY_GEORGIA
	ret nz
	xor a
	ldh [hJoyHeld], a
	ld [wSavedCoordIndex], a
	ld a, [wYCoord]
	cp 6
	ret nz
	ld a, [wXCoord]
	cp 1
	ret nz
	ld a, 1
	ld [wSavedCoordIndex], a
	ld a, PLAYER_DIR_RIGHT
	ld [wPlayerMovingDirection], a
	ld a, BUGSANCTUARY_GEORGIA
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_LEFT
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, TEXT_BUGSANCTUARY_GEORGIA
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ret

BugSanctuaryGeorgiaPostBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jp z, BugSanctuaryResetScripts
	ld a, [wSavedCoordIndex]
	and a ; nz if the player was at (4, 3), left of the Karate Master
	jr z, .already_facing
	ld a, PLAYER_DIR_RIGHT
	ld [wPlayerMovingDirection], a
	ld a, BUGSANCTUARY_GEORGIA
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_LEFT
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
.already_facing
	ld a, D_RIGHT | D_LEFT | D_UP | D_DOWN
	ld [wJoyIgnore], a
	SetEventRange EVENT_BEAT_BUG_SANCTUARY_GEORGIA, EVENT_BEAT_BUG_SANCTUARY_JRTRAINER_F
	ld a, TEXT_BUGSANCTUARY_GEORGIA_I_WILL_GIVE_YOU_A_POKEMON
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a ; SCRIPT_BUGSANCTUARY_DEFAULT
	ld [wJoyIgnore], a
	ld [wBugSanctuaryCurScript], a
	ld [wCurMapScript], a
	ret

BugSanctuary_TextPointers:
	def_text_pointers
	dw_const BugSanctuaryGeorgiaText,         TEXT_BUGSANCTUARY_GEORGIA
	dw_const BugSanctuaryBugCatcher1Text,     TEXT_BUGSANCTUARY_BUGCATCHER1
	dw_const BugSanctuaryBugCatcher2Text,     TEXT_BUGSANCTUARY_BUGCATCHER2
	dw_const BugSanctuaryLassText,            TEXT_BUGSANCTUARY_LASS
	dw_const BugSanctuaryJrTrainerFText,      TEXT_BUGSANCTUARY_JRTRAINER_F
	dw_const BugSanctuaryPinsirPokeBallText,  TEXT_BUGSANCTUARY_PINSIR_POKE_BALL
	dw_const BugSanctuaryScytherPokeBallText, TEXT_BUGSANCTUARY_SCYTHER_POKE_BALL
	dw_const BugSanctuaryGeorgiaText.IWillGiveYouAPokemonText, TEXT_BUGSANCTUARY_GEORGIA_I_WILL_GIVE_YOU_A_POKEMON
	dw_const BugSanctuaryGymSignText, TEXT_BUGSANCTUARY_GYM_SIGN

BugSanctuaryTrainerHeaders:
	def_trainers 2
BugSanctuaryTrainerHeaderBugCatcher1:
	trainer EVENT_BEAT_BUG_SANCTUARY_BUGCATCHER_1, 3, BugSanctuaryBugCatcher1BattleText, BugSanctuaryBugCatcher1EndBattleText, BugSanctuaryBugCatcher1AfterBattleText
BugSanctuaryTrainerHeaderBugCatcher2:
	trainer EVENT_BEAT_BUG_SANCTUARY_BUGCATCHER_2, 2, BugSanctuaryBugCatcher2BattleText, BugSanctuaryBugCatcher2EndBattleText, BugSanctuaryBugCatcher2AfterBattleText
BugSanctuaryTrainerHeaderLass:
	trainer EVENT_BEAT_BUG_SANCTUARY_LASS, 3, BugSanctuaryLassBattleText, BugSanctuaryLassEndBattleText, BugSanctuaryLassAfterBattleText
BugSanctuaryTrainerHeaderJrTrainerF:
	trainer EVENT_BEAT_BUG_SANCTUARY_JRTRAINER_F, 3, BugSanctuaryJrTrainerFBattleText, BugSanctuaryJrTrainerFEndBattleText, BugSanctuaryJrTrainerFAfterBattleText
	db -1

BugSanctuaryGeorgiaText:
	text_asm
	CheckEvent EVENT_DEFEATED_BUG_SANCTUARY
	jp nz, .defeated_sanctuary
	CheckEventReuseA EVENT_BEAT_BUG_SANCTUARY_GEORGIA
	jp nz, .defeated_georgia
	ld hl, .Text
	call PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .DefeatedText
	ld de, .DefeatedText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndexOrTextID]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, SCRIPT_BUGSANCTUARY_GEORGIA_POST_BATTLE
	ld [wBugSanctuaryCurScript], a
	ld [wCurMapScript], a
	jr .end
.defeated_sanctuary
	ld hl, .HelpUsSpreadTheWordText
	call PrintText
	jr .end
.defeated_georgia
	ld hl, .IWillGiveYouAPokemonText
	call PrintText
.end
	jp TextScriptEnd

.Text:
	text "Welcome! I am"
	line "GEORGIA."

	para "I'm leader of the"
	line "BUG SANCTUARY!"

	para "People look down"
	line "on BUG types, but"
	cont "I'll show you"
	cont "what we can do!"

	para "Get ready for a"
	line "real fight!"
	done

.DefeatedText:
	text "A loss"
	line "is a loss, and"
	cont "fair is fair."

	para "Well done."
	prompt

.IWillGiveYouAPokemonText:
	text "We are not yet"
	line "an official"
	cont "#MON league"
	cont "gym."

	para "I can't give you"
	line "a badge, but take"
	cont "one of these bug"
	cont "#MON!"
	done

.HelpUsSpreadTheWordText:
	text "Help us spread"
	line "the word!"

	para "BUG #MON are"
	line "incredible!"
	done

BugSanctuaryBugCatcher1Text:
	text_asm
	ld hl, BugSanctuaryTrainerHeaderBugCatcher1
	call TalkToTrainer
	jp TextScriptEnd

BugSanctuaryBugCatcher1BattleText:
	text "We might not be a"
	line "real gym, but you"
	cont "still shouldn't"
	cont "underestimate us!"
	done

BugSanctuaryBugCatcher1EndBattleText:
	text "I"
	line "underestimated"
	cont "you..."
	prompt

BugSanctuaryBugCatcher1AfterBattleText:
	text "You're good! But"
	line "GEORGIA is the"
	cont "best."
	done

BugSanctuaryBugCatcher2Text:
	text_asm
	ld hl, BugSanctuaryTrainerHeaderBugCatcher2
	call TalkToTrainer
	jp TextScriptEnd

BugSanctuaryBugCatcher2BattleText:
	text "People think BUG"
	line "types are weak."

	para "I'll prove them"
	line "all wrong!"
	done

BugSanctuaryBugCatcher2EndBattleText:
	text "You"
	line "squished me..."
	prompt

BugSanctuaryBugCatcher2AfterBattleText:
	text "BUG types are"
	line "still great!"

	para "I'll never give"
	line "up on them."
	done

BugSanctuaryLassText:
	text_asm
	ld hl, BugSanctuaryTrainerHeaderLass
	call TalkToTrainer
	jp TextScriptEnd

BugSanctuaryLassBattleText:
	text "BUTTERFREE is so"
	line "adorable, don'tcha"
	cont "think?"
	done

BugSanctuaryLassEndBattleText:
	text "Oh no!"
	line "My BUTTERFREE!"
	prompt

BugSanctuaryLassAfterBattleText:
	text "BUG types can be"
	line "cute AND strong."

	para "Just like me!"
	done

BugSanctuaryJrTrainerFText:
	text_asm
	ld hl, BugSanctuaryTrainerHeaderJrTrainerF
	call TalkToTrainer
	jp TextScriptEnd

BugSanctuaryJrTrainerFBattleText:
	text "If you want to"
	line "face GEORGIA,"
	cont "you'll have to go"
	cont "through me!"
	done

BugSanctuaryJrTrainerFEndBattleText:
	text "WOW!"
	line "How did you do"
	cont "that?"
	prompt

BugSanctuaryJrTrainerFAfterBattleText:
	text "You might have"
	line "a chance, but"
	cont "GEORGIA is on"
	cont "another level."
	done

BugSanctuaryPinsirPokeBallText:
	text_asm
	CheckEitherEventSet EVENT_GOT_PINSIR, EVENT_GOT_SCYTHER
	jr z, .GetMon
	ld hl, BugSanctuaryBetterLeaveItText
	call PrintText
	jr .done
.GetMon
	ld a, PINSIR
	call DisplayPokedex
	ld hl, .Text
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
	ld a, [wCurPartySpecies]
	ld b, a
	ld c, 5
	call GivePokemon
	jr nc, .done

	; once Poké Ball is taken, hide sprite
	ld a, HS_BUG_SANCTUARY_GIFT_1
	ld [wMissableObjectIndex], a
	predef HideObject
	SetEvents EVENT_GOT_PINSIR, EVENT_DEFEATED_BUG_SANCTUARY
.done
	jp TextScriptEnd

.Text:
	text "You want the"
	line "rock-crushing"
	cont "PINSIR?"
	done

BugSanctuaryScytherPokeBallText:
	text_asm
	CheckEitherEventSet EVENT_GOT_PINSIR, EVENT_GOT_SCYTHER
	jr z, .GetMon
	ld hl, BugSanctuaryBetterLeaveItText
	call PrintText
	jr .done
.GetMon
	ld a, SCYTHER
	call DisplayPokedex
	ld hl, .Text
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
	ld a, [wCurPartySpecies]
	ld b, a
	ld c, 5
	call GivePokemon
	jr nc, .done
	SetEvents EVENT_GOT_SCYTHER, EVENT_DEFEATED_BUG_SANCTUARY

	; once Poké Ball is taken, hide sprite
	ld a, HS_BUG_SANCTUARY_GIFT_2
	ld [wMissableObjectIndex], a
	predef HideObject
.done
	jp TextScriptEnd

.Text:
	text "You want the"
	line "quick-slashing"
	cont "SCYTHER?"
	done

BugSanctuaryBetterLeaveItText:
	text "Better leave it"
	line "alone..."
	done

BugSanctuaryGymSignText:
	text "VERMILION CITY:"
	line "BUG SANCTUARY"

	para "LEADER: GEORGIA"
	line "THE CRUSHING BUG"
	cont "BEAUTY!"
	done