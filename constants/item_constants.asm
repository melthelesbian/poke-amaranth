; item ids
; indexes for:
; - ItemNames (see data/items/names.asm)
; - ItemPrices (see data/items/prices.asm)
; - TechnicalMachinePrices (see data/items/tm_prices.asm)
; - KeyItemFlags (see data/items/key_items.asm)
; - ItemUsePtrTable (see engine/items/item_effects.asm)
	const_def
	const NO_ITEM       ; $00
	const MASTER_BALL   ; $01
	const ULTRA_BALL    ; $02
	const GREAT_BALL    ; $03
	const POKE_BALL     ; $04
	const UNUSED_05     ; $05 (TOWN_MAP)
	const BICYCLE       ; $06
	const SURFBOARD     ; $07
	const SAFARI_BALL   ; $08
	const POKEDEX       ; $09
	const MOON_STONE    ; $0A
	const UNUSED_0B     ; $0B (ANTIDOTE)
	const UNUSED_0C     ; $0C (BURN_HEAL)
	const UNUSED_0D     ; $0D (ICE_HEAL)
	const UNUSED_0E     ; $0E (AWAKENING)
	const UNUSED_0F     ; $0F (PARLYZ_HEAL)
	const FULL_RESTORE  ; $10
	const MAX_POTION    ; $11
	const HYPER_POTION  ; $12
	const SUPER_POTION  ; $13
	const POTION        ; $14
	const BOULDERBADGE  ; $15
DEF SAFARI_BAIT EQU BOULDERBADGE ; overload
	const CASCADEBADGE  ; $16
DEF SAFARI_ROCK EQU CASCADEBADGE ; overload
	const THUNDERBADGE  ; $17
	const RAINBOWBADGE  ; $18
	const SOULBADGE     ; $19
	const MARSHBADGE    ; $1A
	const VOLCANOBADGE  ; $1B
	const EARTHBADGE    ; $1C
	const ESCAPE_ROPE   ; $1D
	const REPEL         ; $1E
	const OLD_AMBER     ; $1F
	const FIRE_STONE    ; $20
	const THUNDER_STONE ; $21
	const WATER_STONE   ; $22
	const HP_UP         ; $23
	const PROTEIN       ; $24
	const IRON          ; $25
	const CARBOS        ; $26
	const CALCIUM       ; $27
	const RARE_CANDY    ; $28
	const DOME_FOSSIL   ; $29
	const HELIX_FOSSIL  ; $2A
	const UNUSED_2B     ; $2B (SECRET_KEY)
	const ANCIENT_HAIR  ; $2C
	const BIKE_VOUCHER  ; $2D
	const UNUSED_2E     ; $2E
	const LEAF_STONE    ; $2F
	const UNUSED_30     ; $30 (CARD_KEY)
	const NUGGET        ; $31
	const DEVO_SPRAY    ; $32 (ITEM_32)
	const POKE_DOLL     ; $33
	const PANACEA     ; $34
	const REVIVE        ; $35
	const MAX_REVIVE    ; $36
	const TEA_SHIPMENT     ; $37 (GUARD_SPEC)
	const UNUSED_38     ; $38 (SUPER_REPEL)
	const UNUSED_39     ; $39 (MAX_REPEL)
	const UNUSED_3A     ; $3A (DIRE_HIT)
	const COIN          ; $3B
	const FRESH_WATER   ; $3C 
	const ICED_TEA      ; $3D (SODA_POP)
	const LEMONADE      ; $3E
	const UNUSED_3F     ; $3F (SS_TICKET)
	const GOLD_TEETH    ; $40
	const UNUSED_41     ; $41
	const UNUSED_42     ; $42
	const UNUSED_43     ; $43
	const UNUSED_44     ; $44
	const COIN_CASE     ; $45
	const OAKS_PARCEL   ; $46
	const ITEMFINDER    ; $47
	const UNUSED_48     ; $48 (SILPH_SCOPE)
	const POKE_FLUTE    ; $49
	const UNUSED_4A     ; $4A (LIFT_KEY)
	const EXP_ALL       ; $4B
	const UNUSED_4C     ; $4C (OLD_ROD)
	const UNUSED_4D     ; $4D (GOOD_ROD)
	const FISHING_ROD   ; $4E
	const PP_UP         ; $4F
	const ETHER         ; $50
	const MAX_ETHER     ; $51
	const ELIXIR        ; $52
	const MAX_ELIXIR    ; $53
DEF NUM_ITEMS EQU const_value - 1

; elevator floors use item IDs
	const FLOOR_B2F     ; $54
	const FLOOR_B1F     ; $55
	const FLOOR_1F      ; $56
	const FLOOR_2F      ; $57
	const FLOOR_3F      ; $58
	const FLOOR_4F      ; $59
	const FLOOR_5F      ; $5A
	const FLOOR_6F      ; $5B
	const FLOOR_7F      ; $5C
	const FLOOR_8F      ; $5D
	const FLOOR_9F      ; $5E
	const FLOOR_10F     ; $5F
	const FLOOR_11F     ; $60
	const FLOOR_B4F     ; $61
DEF NUM_FLOORS EQU const_value - 1 - NUM_ITEMS

; HMs are defined before TMs, so the actual number of TM definitions
; is not yet available. The TM quantity is hard-coded here and must
; match the actual number below.
DEF NUM_TMS EQU 51

DEF __tmhm_value__ = NUM_TMS + 1

MACRO add_tmnum
	DEF \1_TMNUM EQU __tmhm_value__
	DEF __tmhm_value__ += 1
ENDM

MACRO add_hm
; Defines three constants:
; - HM_\1: the item id, starting at $C4
; - \1_TMNUM: the learnable TM/HM flag, starting at 51
; - HM##_MOVE: alias for the move id, equal to the value of \1
	const HM_\1
	DEF HM_VALUE = __tmhm_value__ - NUM_TMS
	DEF HM_{02d:HM_VALUE} EQU const_value - 1
	DEF HM{02d:HM_VALUE}_MOVE EQU \1
	add_tmnum \1
ENDM

DEF HM01 EQU const_value
	add_hm  CUT
	add_hm  FLY
	add_hm  SURF
	add_hm  STRENGTH
	add_hm  FLASH
DEF NUM_HMS EQU const_value - HM01

DEF __tmhm_value__ = 1

MACRO add_tm
; Defines three constants:
; - TM_\1: the item id, starting at $C9
; - \1_TMNUM: the learnable TM/HM flag, starting at 1
; - TM##_MOVE: alias for the move id, equal to the value of \1
	const TM_\1
	DEF TM_{02d:__tmhm_value__} EQU const_value - 1
	DEF TM{02d:__tmhm_value__}_MOVE EQU \1
	add_tmnum \1
ENDM

DEF TM01 EQU const_value
	add_tm  MEGA_PUNCH
	add_tm  RAZOR_WIND
	add_tm  SWORDS_DANCE
	add_tm  HEADBUTT
	add_tm  TELEPORT
	add_tm  TOXIC
	add_tm  FIRE_PUNCH
	add_tm  ICE_PUNCH
	add_tm  THUNDERPUNCH
	add_tm  RAZOR_LEAF
	add_tm  BUBBLEBEAM
	add_tm  DOUBLE_KICK
	add_tm  ICE_BEAM
	add_tm  THUNDER_WAVE
	add_tm  HYPER_BEAM
	add_tm  LIGHT_SCREEN
	add_tm  REFLECT
	add_tm  AGILITY
	add_tm  SUBMISSION
	add_tm  CRUNCH
	add_tm  MEGA_DRAIN
	add_tm  SOLARBEAM
	add_tm  DRAGONBREATH
	add_tm  THUNDERBOLT
	add_tm  WATERFALL
	add_tm  EARTHQUAKE
	add_tm  FOCUS_ENERGY
	add_tm  DIG
	add_tm  PSYCHIC_M
	add_tm  PSYWAVE
	add_tm  MIMIC
	add_tm  DOUBLE_DASH
	add_tm  SHADOW_TEAR
	add_tm  BIDE
	add_tm  FLAMETHROWER
	add_tm  SLUDGE
	add_tm  BUG_BUZZ
	add_tm  FLARE_RUSH
	add_tm  SWIFT
	add_tm  SKULL_BASH
	add_tm  HYPNOSIS
	add_tm  DREAM_EATER
	add_tm  VENOM_STRIKE
	add_tm  REST
	add_tm  MOONBLAST
	add_tm  PAY_DAY
	add_tm  HEAVY_SMASH
	add_tm  ROCK_SLIDE
	add_tm  FURY_CUT
	add_tm  SUBSTITUTE
	add_tm  METRONOME
ASSERT NUM_TMS == const_value - TM01, "NUM_TMS ({d:NUM_TMS}) does not match the number of add_tm definitions"

DEF NUM_TM_HM EQU NUM_TMS + NUM_HMS

; 51 TMs + 5 HMs = 56 learnable TM/HM flags per Pokémon.
; These fit in 7 bytes.
DEF __tmhm_value__ = NUM_TM_HM + 1
DEF UNUSED_TMNUM EQU __tmhm_value__

DEF MAX_HIDDEN_ITEMS EQU 112
DEF MAX_HIDDEN_COINS EQU 16
