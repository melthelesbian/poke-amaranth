; move ids
; indexes for:
; - Moves (see data/moves/moves.asm)
; - MoveNames (see data/moves/names.asm)
; - AttackAnimationPointers (see data/moves/animations.asm)
; - MoveSoundTable (see data/moves/sfx.asm)
	const_def
	const NO_MOVE      ; 0
	const POUND        ; 1
	const KARATE_CHOP  ; 2
	const DOUBLESLAP   ; 3
	const DRAGONBREATH ; 4
	const MEGA_PUNCH   ; 5
	const PAY_DAY      ; 6
	const FIRE_PUNCH   ; 7
	const ICE_PUNCH    ; 8
	const THUNDERPUNCH ; 9
	const SCRATCH      ; 10
	const VICEGRIP     ; 11
	const GUILLOTINE   ; 12
	const RAZOR_WIND   ; 13
	const SWORDS_DANCE ; 14
	const CUT          ; 15
	const GUST         ; 16
	const WING_ATTACK  ; 17
	const ICY_WIND     ; 18
	const FLY          ; 19
	const FEINT_ATTACK ; 20
	const HEAVY_SMASH  ; 21
	const VINE_WHIP    ; 22
	const ASTONISH     ; 23
	const DOUBLE_KICK  ; 24
	const MOONBLAST    ; 25
	const JUMP_KICK    ; 26
	const ROLLING_KICK ; 27
	const MUD_SLAP     ; 28
	const HEADBUTT     ; 29
	const HORN_ATTACK  ; 30
	const FURY_CUT     ; 31
	const BUG_BUZZ     ; 32
	const TACKLE       ; 33
	const BODY_SLAM    ; 34
	const WRAP         ; 35
	const TAKE_DOWN    ; 36
	const THRASH       ; 37
	const FLARE_RUSH   ; 38
	const TAIL_WHIP    ; 39
	const POISON_STING ; 40
	const TWINEEDLE    ; 41
	const BUG_BITE     ; 42
	const LEER         ; 43
	const BITE         ; 44
	const GROWL        ; 45
	const FRIGHTEN     ; 46
	const SING         ; 47
	const SWEET_CRY    ; 48
	const SONICBOOM    ; 49
	const DISABLE      ; 50
	const ACID         ; 51
	const EMBER        ; 52
	const FLAMETHROWER ; 53
	const MIST         ; 54
	const WATER_GUN    ; 55
	const HYDRO_PUMP   ; 56
	const SURF         ; 57
	const ICE_BEAM     ; 58
	const BLIZZARD     ; 59
	const PSYBEAM      ; 60
	const BUBBLEBEAM   ; 61
	const AURORA_BEAM  ; 62
	const HYPER_BEAM   ; 63
	const PECK         ; 64
	const DRILL_PECK   ; 65
	const SUBMISSION   ; 66
	const LOW_KICK     ; 67
	const COUNTER      ; 68
	const SEISMIC_TOSS ; 69
	const STRENGTH     ; 70
	const ABSORB       ; 71
	const MEGA_DRAIN   ; 72
	const LEECH_SEED   ; 73
	const GROWTH       ; 74
	const RAZOR_LEAF   ; 75
	const SOLARBEAM    ; 76
	const POISONPOWDER ; 77
	const STUN_SPORE   ; 78
	const SLEEP_POWDER ; 79
	const PETAL_DANCE  ; 80
	const STRING_SHOT  ; 81
	const DRAGON_RAGE  ; 82
	const FIRE_SPIN    ; 83
	const THUNDERSHOCK ; 84
	const THUNDERBOLT  ; 85
	const THUNDER_WAVE ; 86
	const THUNDER      ; 87
	const ROCK_THROW   ; 88
	const EARTHQUAKE   ; 89
	const FISSURE      ; 90
	const DIG          ; 91
	const TOXIC        ; 92
	const CONFUSION    ; 93
	const PSYCHIC_M    ; 94
	const HYPNOSIS     ; 95
	const PREPARE      ; 96
	const AGILITY      ; 97
	const QUICK_ATTACK ; 98
	const RAGE         ; 99
	const TELEPORT     ; 100
	const NIGHT_SHADE  ; 101
	const MIMIC        ; 102
	const SCREECH      ; 103
	const DOUBLE_DASH  ; 104
	const RECOVER      ; 105
	const SPARK        ; 106
	const MINIMIZE     ; 107
	const SMOKESCREEN  ; 108
	const CONFUSE_RAY  ; 109
	const FLAME_CHARGE ; 110
	const DEFENSE_CURL ; 111
	const BARRIER      ; 112
	const LIGHT_SCREEN ; 113
	const HAZE         ; 114
	const REFLECT      ; 115
	const FOCUS_ENERGY ; 116
	const BIDE         ; 117
	const METRONOME    ; 118
	const MIRROR_MOVE  ; 119
	const SELFDESTRUCT ; 120
	const EGG_BOMB     ; 121
	const LICK         ; 122
	const SMOG         ; 123
	const SLUDGE       ; 124
	const BONE_CLUB    ; 125
	const FIRE_BLAST   ; 126
	const WATERFALL    ; 127
	const WHIRLPOOL    ; 128
	const SWIFT        ; 129
	const SKULL_BASH   ; 130
	const SPIKE_CANNON ; 131
	const NIGHT_SLASH  ; 132
	const AMNESIA      ; 133
	const KINESIS      ; 134
	const SOFTBOILED   ; 135
	const HI_JUMP_KICK ; 136
	const GLARE        ; 137
	const DREAM_EATER  ; 138
	const POISON_GAS   ; 139
	const BARRAGE      ; 140
	const LEECH_LIFE   ; 141
	const DRAIN_KISS   ; 142
	const SKY_ATTACK   ; 143
	const TRANSFORM    ; 144
	const BUBBLE       ; 145
	const DIZZY_PUNCH  ; 146
	const SPORE        ; 147
	const FLASH        ; 148
	const PSYWAVE      ; 149
	const SPLASH       ; 150
	const POWDER_SNOW  ; 151
	const CRABHAMMER   ; 152
	const EXPLOSION    ; 153
	const FURY_SWIPES  ; 154
	const BONEMERANG   ; 155
	const REST         ; 156
	const ROCK_SLIDE   ; 157
	const CRUNCH       ; 158
	const SHADOW_CLAW  ; 159
	const CONVERSION   ; 160
	const TRI_ATTACK   ; 161
	const SUPER_FANG   ; 162
	const SLASH        ; 163
	const SUBSTITUTE   ; 164
	const STRUGGLE     ; 165
DEF NUM_ATTACKS EQU const_value - 1
