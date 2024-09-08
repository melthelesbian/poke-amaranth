MACRO move
	db \1 ; animation (interchangeable with move id)
	db \2 ; effect
	db \3 ; power
	db \4 ; type
	db \5 percent ; accuracy
	db \6 ; pp
	assert \6 <= 40, "PP must be 40 or less"
ENDM

Moves:
; Characteristics of each move.
	table_width MOVE_LENGTH, Moves
	move POUND,        NO_ADDITIONAL_EFFECT,       40,   NORMAL,       100, 35
	move KARATE_CHOP,  NO_ADDITIONAL_EFFECT,       50,   FIGHTING,     100, 25 ; high crit ratio
	move DOUBLESLAP,   ATTACK_TWICE_EFFECT,        35,   NORMAL,       100, 20
	move DRAGONBREATH, PARALYZE_SIDE_EFFECT2,      60,   DRAGON,       100, 20 ; (COMET_PUNCH)
	move MEGA_PUNCH,   NO_ADDITIONAL_EFFECT,       60,   NORMAL,       100, 20
	move PAY_DAY,      PAY_DAY_EFFECT,             50,   DARK,         100, 20
	move FIRE_PUNCH,   BURN_SIDE_EFFECT1,          75,   FIRE,         100, 15
	move ICE_PUNCH,    FREEZE_SIDE_EFFECT,         75,   ICE,          100, 15
	move THUNDERPUNCH, PARALYZE_SIDE_EFFECT1,      75,   ELECTRIC,     100, 20
	move SCRATCH,      NO_ADDITIONAL_EFFECT,       40,   NORMAL,       100, 35
	move CRUSH,        NO_ADDITIONAL_EFFECT,       50,   STEEL,        100, 30 ; (VICEGRIP)
	move GUILLOTINE,   CHARGE_EFFECT,              200,  STEEL,        95,  5  ; needs charge text
	move RAZOR_WIND,   NO_ADDITIONAL_EFFECT,       95,   FLYING,       100, 15
	move SWORDS_DANCE, ATTACK_UP2_EFFECT,          0,    MYSTERY,      100, 30
	move CUT,          NO_ADDITIONAL_EFFECT,       70,   STEEL,        95,  30
	move GUST,         SPEED_DOWN_SIDE_EFFECT,     40,   FLYING,       100, 35
	move WING_ATTACK,  NO_ADDITIONAL_EFFECT,       60,   FLYING,       100, 25
	move ICY_WIND,     SPEED_DOWN_SIDE_EFFECT,     50,   ICE,          100, 15 ; (WHIRLWIND)
	move FLY,          FLY_EFFECT,                 75,   FLYING,       95,  15
	move FEINT_ATTACK, SWIFT_EFFECT,               60,   DARK,         100, 20 ; (BIND)
	move HEAVY_SMASH,  PARALYZE_SIDE_EFFECT2,      80,   STEEL,        100, 15 ; (SLAM)
	move VINE_WHIP,    NO_ADDITIONAL_EFFECT,       40,   GRASS,        100, 10
	move ASTONISH,     FLINCH_SIDE_EFFECT1,        40,   GHOST,        100, 15 ; (STOMP)
	move DOUBLE_KICK,  ATTACK_TWICE_EFFECT,        30,   FIGHTING,     100, 25
	move MOONBLAST,    SPECIAL_DOWN_SIDE_EFFECT,   95,   FAIRY,        100, 15 ; (MEGA_KICK)
	move JUMP_KICK,    JUMP_KICK_EFFECT,           65,   FIGHTING,     95,  25
	move ROLLING_KICK, FLINCH_SIDE_EFFECT2,        60,   FIGHTING,     85,  15
	move MUD_SLAP,     NO_ADDITIONAL_EFFECT,       40,   GROUND,       100, 25 ; (SAND_ATTACK)
	move HEADBUTT,     FLINCH_SIDE_EFFECT2,        70,   NORMAL,       100, 15
	move HORN_ATTACK,  NO_ADDITIONAL_EFFECT,       40,   ROCK,         100, 35
	move FURY_CUT,     RAGE_EFFECT,                40,   BUG,          95,  20 ; (FURY_ATTACK)
	move BUG_BUZZ,     SPECIAL_DOWN_SIDE_EFFECT,   90,   BUG,          100, 10 ; (HORN_DRILL)
	move TACKLE,       NO_ADDITIONAL_EFFECT,       40,   NORMAL,       100, 35
	move BODY_SLAM,    PARALYZE_SIDE_EFFECT2,      90,   NORMAL,       100, 15
	move WRAP,         TRAPPING_EFFECT,            20,   NORMAL,       85,  20
	move TAKE_DOWN,    RECOIL_EFFECT,              120,  NORMAL,       100, 20
	move THRASH,       THRASH_PETAL_DANCE_EFFECT,  100,  DRAGON,       100, 10
	move FLARE_RUSH,   RECOIL_EFFECT,              120,  FIRE,         100, 15 ; (DOUBLE_EDGE)
	move TAIL_WHIP,    DEFENSE_DOWN_SIDE_EFFECT,   50,   NORMAL,       100, 25
	move POISON_STING, POISON_SIDE_EFFECT1,        40,   POISON,       100, 35
	move TWINEEDLE,    TWINEEDLE_EFFECT,           35,   BUG,          100, 20
	move BUG_BITE,     NO_ADDITIONAL_EFFECT,       40,   BUG,          100, 35 ; (PIN_MISSILE)
	move LEER,         DEFENSE_DOWN1_EFFECT,       0,    MYSTERY,      100, 30
	move BITE,         FLINCH_SIDE_EFFECT1,        60,   DARK,         100, 25
	move GROWL,        ATTACK_DOWN1_EFFECT,        0,    MYSTERY,      100, 40
	move FRIGHTEN,     SWITCH_AND_TELEPORT_EFFECT, 0,    MYSTERY,      100, 20 ; tweak move text? (ROAR)
	move SING,         SLEEP_EFFECT,               0,    MYSTERY,      75,  15
	move SWEET_CRY,    ATTACK_DOWN_SIDE_EFFECT,    40,   FAIRY,        100, 15 ; (SUPERSONIC)
	move SONICBOOM,    SPECIAL_DAMAGE_EFFECT,      1,    NORMAL,       90,  20
	move DISABLE,      DISABLE_EFFECT,             0,    MYSTERY,      75,  20
	move ACID,         BURN_SIDE_EFFECT1,          50,   POISON,       100, 30
	move EMBER,        BURN_SIDE_EFFECT1,          40,   FIRE,         100, 25
	move FLAMETHROWER, BURN_SIDE_EFFECT1,          95,   FIRE,         100, 15
	move MIST,         MIST_EFFECT,                0,    MYSTERY,      100, 30
	move WATER_GUN,    NO_ADDITIONAL_EFFECT,       40,   WATER,        100, 30
	move HYDRO_PUMP,   NO_ADDITIONAL_EFFECT,       120,  WATER,        90,  5
	move SURF,         NO_ADDITIONAL_EFFECT,       90,   WATER,        100, 15
	move ICE_BEAM,     FREEZE_SIDE_EFFECT,         95,   ICE,          100, 10
	move BLIZZARD,     FREEZE_SIDE_EFFECT,         120,  ICE,          90,  5
	move PSYBEAM,      CONFUSION_SIDE_EFFECT,      65,   PSYCHIC_TYPE, 100, 20
	move BUBBLEBEAM,   SPEED_DOWN_SIDE_EFFECT,     65,   WATER,        100, 20
	move AURORA_BEAM,  ATTACK_DOWN_SIDE_EFFECT,    60,   ICE,          100, 20
	move HYPER_BEAM,   HYPER_BEAM_EFFECT,          150,  NORMAL,       95,  5
	move PECK,         FLINCH_SIDE_EFFECT1,        40,   FLYING,       100, 35
	move DRILL_PECK,   NO_ADDITIONAL_EFFECT,       60,   FLYING,       100, 20 ; high crit ratio
	move SUBMISSION,   RECOIL_EFFECT,              90,   FIGHTING,     90,  25
	move LOW_KICK,     ATTACK_DOWN_SIDE_EFFECT,    40,   FIGHTING,     90,  20
	move COUNTER,      NO_ADDITIONAL_EFFECT,       1,    MYSTERY,      100, 20
	move SEISMIC_TOSS, SPECIAL_DAMAGE_EFFECT,      1,    FIGHTING,     100, 20
	move STRENGTH,     NO_ADDITIONAL_EFFECT,       80,   FIGHTING,     100, 15
	move ABSORB,       DRAIN_HP_EFFECT,            40,   GRASS,        100, 30
	move MEGA_DRAIN,   DRAIN_HP_EFFECT,            80,   GRASS,        100, 10
	move LEECH_SEED,   LEECH_SEED_EFFECT,          0,    GRASS,        90,  10
	move GROWTH,       SPECIAL_UP1_EFFECT,         0,    MYSTERY,      100, 40
	move RAZOR_LEAF,   NO_ADDITIONAL_EFFECT,       70,   GRASS,        95,  25 ; high crit ratio
	move SOLARBEAM,    CHARGE_EFFECT,              150,  GRASS,        100, 15
	move POISON_CLOUD, POISON_EFFECT,              0,    POISON,       75,  30 ; (POISONPOWDER)
	move STUN_CLOUD,   PARALYZE_EFFECT,            0,    GRASS,        75,  30 ; (STUN_SPORE)
	move SLEEP_CLOUD,  SLEEP_EFFECT,               0,    GRASS,        75,  30 ; (SLEEP_POWDER)
	move PETAL_DANCE,  THRASH_PETAL_DANCE_EFFECT,  100,  GRASS,        100, 20
	move STRING_SHOT,  PARALYZE_SIDE_EFFECT1,      25,   BUG,          95,  30
	move DRAGON_RAGE,  SPECIAL_DAMAGE_EFFECT,      1,    DRAGON,       100, 15
	move FIRE_SPIN,    TRAPPING_EFFECT,            25,   FIRE,         75,  15
	move THUNDERSHOCK, PARALYZE_SIDE_EFFECT1,      40,   ELECTRIC,     100, 30
	move THUNDERBOLT,  PARALYZE_SIDE_EFFECT1,      95,   ELECTRIC,     100, 15
	move THUNDER_WAVE, PARALYZE_EFFECT,            0,    ELECTRIC,     100, 20
	move THUNDER,      PARALYZE_SIDE_EFFECT1,      120,  ELECTRIC,     85,  5
	move ROCK_THROW,   NO_ADDITIONAL_EFFECT,       50,   ROCK,         100, 15
	move EARTHQUAKE,   NO_ADDITIONAL_EFFECT,       95,   GROUND,       100, 10
	move FISSURE,      EXPLODE_EFFECT,             150,  GROUND,       100, 5
	move DIG,          CHARGE_EFFECT,              75,   GROUND,       100, 15
	move TOXIC,        POISON_EFFECT,              0,    POISON,       95,  15
	move CONFUSION,    CONFUSION_SIDE_EFFECT,      40,   PSYCHIC_TYPE, 100, 25
	move PSYCHIC_M,    SPECIAL_DOWN_SIDE_EFFECT,   95,   PSYCHIC_TYPE, 100, 10
	move HYPNOSIS,     SLEEP_EFFECT,               0,    MYSTERY,      85,  20
	move PREPARE,      ATTACK_UP1_EFFECT,          0,    MYSTERY,      100, 40 ; tweak move text? (MEDITATE)
	move AGILITY,      SPEED_UP2_EFFECT,           0,    MYSTERY,      100, 30
	move QUICK_ATTACK, NO_ADDITIONAL_EFFECT,       40,   NORMAL,       100, 30
	move RAGE,         RAGE_EFFECT,                40,   NORMAL,       100, 20
	move TELEPORT,     SWITCH_AND_TELEPORT_EFFECT, 0,    MYSTERY,      100, 20
	move NIGHT_SHADE,  SPECIAL_DAMAGE_EFFECT,      0,    GHOST,        100, 15
	move MIMIC,        MIMIC_EFFECT,               0,    MYSTERY,      100, 10
	move SCREECH,      DEFENSE_DOWN2_EFFECT,       0,    MYSTERY,      100, 40
	move DOUBLE_DASH,  ATTACK_TWICE_EFFECT,        35,   FAIRY,        100, 20 ; (DOUBLE_TEAM)
	move RECOVER,      HEAL_EFFECT,                0,    MYSTERY,      100, 20
	move SPARK,        PARALYZE_SIDE_EFFECT2,      65,   ELECTRIC,     100, 20 ; (HARDEN)
	move MINIMIZE,     SPECIAL_UP2_EFFECT,         0,    MYSTERY,      100, 15
	move SMOKESCREEN,  CONFUSION_EFFECT,           0,    MYSTERY,      75,  20
	move CONFUSE_RAY,  CONFUSION_EFFECT,           0,    MYSTERY,      100, 10
	move FLAME_CHARGE, CONFUSION_SIDE_EFFECT,      60,   FIRE,         100, 20 ; (WITHDRAW)
	move DEFENSE_CURL, DEFENSE_UP1_EFFECT,         0,    MYSTERY,      100, 40
	move BARRIER,      DEFENSE_UP2_EFFECT,         0,    MYSTERY,      100, 30
	move LIGHT_SCREEN, LIGHT_SCREEN_EFFECT,        0,    MYSTERY,      100, 30
	move HAZE,         HAZE_EFFECT,                0,    MYSTERY,      100, 30
	move REFLECT,      REFLECT_EFFECT,             0,    MYSTERY,      100, 20
	move FOCUS_ENERGY, FOCUS_ENERGY_EFFECT,        0,    MYSTERY,      100, 30
	move BIDE,         BIDE_EFFECT,                0,    NORMAL,       100, 10
	move METRONOME,    METRONOME_EFFECT,           0,    MYSTERY,      100, 10
	move MIRROR_MOVE,  MIRROR_MOVE_EFFECT,         0,    MYSTERY,      100, 20
	move SELFDESTRUCT, EXPLODE_EFFECT,             150,  NORMAL,       100, 5
	move EGG_BOMB,     NO_ADDITIONAL_EFFECT,       100,  GRASS,        95,  10
	move LICK,         PARALYZE_SIDE_EFFECT2,      25,   DARK,         100, 30
	move SMOG,         POISON_SIDE_EFFECT2,        65,   POISON,       100, 25
	move SLUDGE,       POISON_SIDE_EFFECT2,        90,   POISON,       100, 15
	move BONE_CLUB,    FLINCH_SIDE_EFFECT1,        60,   GROUND,       100, 20
	move FIRE_BLAST,   BURN_SIDE_EFFECT2,          100,  FIRE,         90,  5
	move WATERFALL,    FLINCH_SIDE_EFFECT2,        70,   WATER,        90,  15
	move WHIRLPOOL,    TRAPPING_EFFECT,            25,   WATER,        75,  15 ; (CLAMP)
	move SWIFT,        SWIFT_EFFECT,               60,   FAIRY,        100, 20
	move SKULL_BASH,   CHARGE_EFFECT,              150,  ROCK,         100, 15
	move SPIKE_CANNON, TWO_TO_FIVE_ATTACKS_EFFECT, 25,   ROCK,         100, 15
	move NIGHT_SLASH,  NO_ADDITIONAL_EFFECT,       70,   DARK,         100, 15 ; high crit ratio (CONSTRICT)
	move AMNESIA,      SPECIAL_UP2_EFFECT,         0,    MYSTERY,      100, 20
	move KINESIS,      FLINCH_SIDE_EFFECT1,        50,   PSYCHIC_TYPE, 100, 15
	move SOFTBOILED,   HEAL_EFFECT,                0,    MYSTERY,      100, 10
	move HI_JUMP_KICK, JUMP_KICK_EFFECT,           95,   FIGHTING,     100, 20
	move GLARE,        PARALYZE_EFFECT,            0,    MYSTERY,      75,  30
	move DREAM_EATER,  DREAM_EATER_EFFECT,         100,  GHOST,        100, 15
	move VENOM_STRIKE, NO_ADDITIONAL_EFFECT,       70,   POISON,       100, 20 ; high crit ratio (POISON_GAS)
	move BARRAGE,      TWO_TO_FIVE_ATTACKS_EFFECT, 25,   GRASS,        85,  20
	move LEECH_LIFE,   DRAIN_HP_EFFECT,            60,   BUG,          95,  20
	move DRAIN_KISS,   DRAIN_HP_EFFECT,            50,   FAIRY,        100, 20 ; (LOVELY_KISS)
	move SKY_ATTACK,   CHARGE_EFFECT,              200,  FLYING,       100, 5
	move TRANSFORM,    TRANSFORM_EFFECT,           0,    MYSTERY,      100, 10
	move BUBBLE,       TWO_TO_FIVE_ATTACKS_EFFECT, 15,   WATER,        90,  25
	move DIZZY_PUNCH,  THRASH_PETAL_DANCE_EFFECT,  70,   NORMAL,       100, 10
	move SPORE,        SLEEP_EFFECT,               0,    GRASS,        100, 15
	move FLASH,        CONFUSION_SIDE_EFFECT,      70,   ELECTRIC,     100, 20
	move PSYWAVE,      SPECIAL_DAMAGE_EFFECT,      1,    PSYCHIC_TYPE, 80,  15
	move SPLASH,       SPLASH_EFFECT,              0,    WATER,        100, 40
	move POWDER_SNOW,  FREEZE_SIDE_EFFECT,         40,   ICE,          100, 25 ; (ACID_ARMOR)
	move CRABHAMMER,   NO_ADDITIONAL_EFFECT,       90,   STEEL,        95,  10 ; high crit ratio
	move EXPLOSION,    EXPLODE_EFFECT,             250,  NORMAL,       100, 5
	move FURY_SWIPES,  TWO_TO_FIVE_ATTACKS_EFFECT, 20,   NORMAL,       85,  20
	move BONEMERANG,   ATTACK_TWICE_EFFECT,        50,   GROUND,       100, 10
	move REST,         HEAL_EFFECT,                0,    MYSTERY,      100, 10
	move ROCK_SLIDE,   NO_ADDITIONAL_EFFECT,       75,   ROCK,         95,  10
	move CRUNCH,       DEFENSE_DOWN_SIDE_EFFECT,   80,   DARK,         90,  15 ; (HYPER_FANG)
	move SHADOW_TEAR,  NO_ADDITIONAL_EFFECT,       70,   GHOST,        100, 15 ; high crit ratio (SHARPEN)
	move CONVERSION,   CONVERSION_EFFECT,          0,    MYSTERY,      100, 30
	move TRI_ATTACK,   NO_ADDITIONAL_EFFECT,       80,   MYSTERY,      100, 10
	move SUPER_FANG,   SUPER_FANG_EFFECT,          1,    DARK,         90,  10
	move SLASH,        NO_ADDITIONAL_EFFECT,       70,   NORMAL,       100, 20 ; high crit ratio
	move SUBSTITUTE,   SUBSTITUTE_EFFECT,          0,    MYSTERY,      100, 10
	move STRUGGLE,     RECOIL_EFFECT,              50,   MYSTERY,      100, 10
	assert_table_length NUM_ATTACKS
