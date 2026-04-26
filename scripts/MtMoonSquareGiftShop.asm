MtMoonSquareGiftShop_Script:
	jp EnableAutoTextBoxDrawing

MtMoonSquareGiftShop_TextPointers:
	def_text_pointers
	dw_const MtMoonSquareGiftShop_ClerkText, TEXT_MTMOONSQUAREGIFTSHOP_CLERK
	dw_const MtMoonSquareGiftShop_NurseText, TEXT_MTMOONSQUAREGIFTSHOP_NURSE
	dw_const MtMoonSquareGiftShop_StoneTagText, TEXT_MTMOONSQUAREGIFTSHOP_STONE_TAG
	dw_const MtMoonSquareGiftShop_TelescopeTagText, TEXT_MTMOONSQUAREGIFTSHOP_TELESCOPE_TAG

MtMoonSquareGiftShop_ClerkText:
	script_mart POKE_DOLL, LEAF_STONE, FIRE_STONE, WATER_STONE, THUNDER_STONE, MOON_STONE

MtMoonSquareGiftShop_NurseText:
	text_asm
	ld hl, MtMoonSquareNurse_BeforeHealText
	call PrintText
	call GBFadeOutToWhite
	call ReloadMapData
	predef HealParty
	ld a, [wAudioROMBank]
	cp BANK("Audio Engine 3")
	ld [wAudioSavedROMBank], a
	jr nz, .not_audio_engine_3
	ld a, SFX_STOP_ALL_MUSIC
	ld [wNewSoundID], a
	call PlaySound
	ld a, BANK(Music_PkmnHealed)
	ld [wAudioROMBank], a
.not_audio_engine_3
	ld a, MUSIC_PKMN_HEALED
	ld [wNewSoundID], a
	call PlaySound
.loop
	ld a, [wChannelSoundIDs]
	cp MUSIC_PKMN_HEALED
	jr z, .loop
	call PlayDefaultMusic
	call GBFadeInFromWhite
	ld hl, MtMoonSquareNurse_AfterHealText
	call PrintText
	jp TextScriptEnd

MtMoonSquareNurse_BeforeHealText:
	text "Oh! Let me heal"
	line "your #MON!"
	prompt

MtMoonSquareNurse_AfterHealText:
	text "Your #MON are"
	line "looking spirited!"
	cont "Take care!"
	done

MtMoonSquareGiftShop_StoneTagText:
	text "EVOLUTION STONES"
	line "On sale now!"
	done

MtMoonSquareGiftShop_TelescopeTagText:
	text "STARGAZER 2000"
	line "Buy a telescope"
	cont "today!"
	done