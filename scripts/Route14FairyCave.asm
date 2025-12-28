Route14FairyCave_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route14FairyCaveTrainerHeaders
	ld de, Route14FairyCave_ScriptPointers
	ld a, [wRoute14FairyCaveCurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute14FairyCaveCurScript], a
	ret

Route14FairyCave_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_ROUTE14FAIRYCAVE_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_ROUTE14FAIRYCAVE_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_ROUTE14FAIRYCAVE_END_BATTLE

Route14FairyCave_TextPointers:
    def_text_pointers
    dw_const Route14FairyCaveSweetheartText, TEXT_ROUTE14FAIRYCAVE_SWEETHEART
    dw_const PickUpItemText, TEXT_ROUTE14FAIRYCAVE_TM_DOUBLE_DASH

Route14FairyCaveTrainerHeaders:
    def_trainers 3 ; magic value because idk 
Route14FairyCaveTrainerHeader:
    trainer EVENT_BEAT_ROUTE_14_FAIRY_CAVE_TRAINER, 1, Route14FairyCaveSweetheartBattleText, Route14FairyCaveSweetheartEndBattleText, Route14FairyCaveSweetheartAfterBattleText
    db -1

Route14FairyCaveSweetheartText:
    text_asm
	ld hl, Route14FairyCaveTrainerHeader
	call TalkToTrainer
	jp TextScriptEnd

Route14FairyCaveSweetheartBattleText:
    text "Oh! You caught me"
    line "by surprise."
    done

Route14FairyCaveSweetheartEndBattleText:
    text "Oops!"
    line "I didn't win."
    prompt

Route14FairyCaveSweetheartAfterBattleText:
    text "The #MON here"
    line "are adorable,"
    cont "don't you think?"
    done