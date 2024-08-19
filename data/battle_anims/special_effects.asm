MACRO anim_special_effect
	db \1
	dw \2
ENDM

AnimationIdSpecialEffects:
	; animation id, effect routine address
	anim_special_effect MEGA_PUNCH_ANIM,            AnimationFlashScreen
	anim_special_effect GUILLOTINE_ANIM,            AnimationFlashScreen
	anim_special_effect MEGA_KICK_ANIM,             AnimationFlashScreen
	anim_special_effect HEADBUTT_ANIM,              AnimationFlashScreen
	anim_special_effect TAIL_WHIP_ANIM,             TailWhipAnimationUnused
	anim_special_effect GROWL_ANIM,                 DoGrowlSpecialEffects
	anim_special_effect DISABLE_ANIM,               AnimationFlashScreen
	anim_special_effect BLIZZARD_ANIM,              DoBlizzardSpecialEffects
	anim_special_effect BUBBLEBEAM_ANIM,            AnimationFlashScreen
	anim_special_effect HYPER_BEAM_ANIM,            FlashScreenEveryFourFrameBlocks
	anim_special_effect THUNDERBOLT_ANIM,           FlashScreenEveryEightFrameBlocks
	anim_special_effect REFLECT_ANIM,               AnimationFlashScreen
	anim_special_effect SELFDESTRUCT_ANIM,          DoExplodeSpecialEffects
	anim_special_effect SPORE_ANIM,                 AnimationFlashScreen
	anim_special_effect EXPLOSION_ANIM,             DoExplodeSpecialEffects
	anim_special_effect ROCK_SLIDE_ANIM,            DoRockSlideSpecialEffects
	anim_special_effect TRADE_BALL_DROP_ANIM,       TradeHidePokemon
	anim_special_effect TRADE_BALL_SHAKE_ANIM,      TradeShakePokeball
	anim_special_effect TRADE_BALL_TILT_ANIM,       TradeJumpPokeball
	anim_special_effect TOSS_ANIM,                  DoBallTossSpecialEffects
	anim_special_effect SHAKE_ANIM,                 DoBallShakeSpecialEffects
	anim_special_effect POOF_ANIM,                  DoPoofSpecialEffects
	anim_special_effect GREATTOSS_ANIM,             DoBallTossSpecialEffects
	anim_special_effect ULTRATOSS_ANIM,             DoBallTossSpecialEffects
	db -1 ; end
