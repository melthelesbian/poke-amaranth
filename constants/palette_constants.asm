; monochrome palette color ids
	const_def
	const SHADE_WHITE ; %00
	const SHADE_LIGHT ; %01
	const SHADE_DARK  ; %10
	const SHADE_BLACK ; %11
DEF NUM_PAL_COLORS EQU const_value

DEF PAL_COLOR_SIZE EQU 2
DEF PALETTE_SIZE EQU NUM_PAL_COLORS * PAL_COLOR_SIZE

; pal/blk packets
; SetPalFunctions indexes (see engine/gfx/palettes.asm)
	const_def
	const SET_PAL_BATTLE_BLACK         ; $00
	const SET_PAL_BATTLE               ; $01
	const SET_PAL_TOWN_MAP             ; $02
	const SET_PAL_STATUS_SCREEN        ; $03
	const SET_PAL_POKEDEX              ; $04
	const SET_PAL_SLOTS                ; $05
	const SET_PAL_TITLE_SCREEN         ; $06
	const SET_PAL_NIDORINO_INTRO       ; $07
	const SET_PAL_GENERIC              ; $08
	const SET_PAL_OVERWORLD            ; $09
	const SET_PAL_PARTY_MENU           ; $0A
	const SET_PAL_POKEMON_WHOLE_SCREEN ; $0B
	const SET_PAL_GAME_FREAK_INTRO     ; $0C
	const SET_PAL_TRAINER_CARD         ; $0D

DEF SET_PAL_PARTY_MENU_HP_BARS EQU $fc
DEF SET_PAL_DEFAULT EQU $ff

; sgb palettes
; SuperPalettes indexes (see data/sgb/sgb_palettes.asm)
	const_def
	const PAL_ROUTE     ; $00
	const PAL_PALLET    ; $01
	const PAL_VIRIDIAN  ; $02
	const PAL_PEWTER    ; $03
	const PAL_CERULEAN  ; $04
	const PAL_LAVENDER  ; $05
	const PAL_VERMILION ; $06
	const PAL_CELADON   ; $07
	const PAL_FUCHSIA   ; $08
	const PAL_CINNABAR  ; $09
	const PAL_INDIGO    ; $0A
	const PAL_SAFFRON   ; $0B
	const PAL_TOWNMAP   ; $0C
	const PAL_LOGO1     ; $0D
	const PAL_LOGO2     ; $0E
	const PAL_0F        ; $0F
	const PAL_MEWMON    ; $10
	const PAL_BLUEMON   ; $11
	const PAL_REDMON    ; $12
	const PAL_CYANMON   ; $13
	const PAL_PURPLEMON ; $14
	const PAL_BROWNMON  ; $15
	const PAL_GREENMON  ; $16
	const PAL_PINKMON   ; $17
	const PAL_YELLOWMON ; $18
	const PAL_GREYMON   ; $19
	const PAL_AMARANTH  ; [TODO) shift values
	const PAL_SLOTS1    ; $1A
	const PAL_SLOTS2    ; $1B
	const PAL_SLOTS3    ; $1C
	const PAL_SLOTS4    ; $1D
	const PAL_BLACK     ; $1E
	const PAL_GREENBAR  ; $1F
	const PAL_YELLOWBAR ; $20
	const PAL_REDBAR    ; $21
	const PAL_BADGE     ; $22
	const PAL_CAVE      ; $23
	const PAL_GAMEFREAK ; $24
	; POKEMON PALETTES
	const PAL_MISSINGNO
	const PAL_BULBASAUR
	const PAL_IVYSAUR
	const PAL_VENUSAUR
	const PAL_CHARMANDER
	const PAL_CHARMELEON
	const PAL_CHARIZARD
	const PAL_SQUIRTLE
	const PAL_WARTORTLE
	const PAL_BLASTOISE
	const PAL_RATTATA
	const PAL_RATICATE
	const PAL_PIDGEY
	const PAL_PIDGEOTTO
	const PAL_PIDGEOT
	const PAL_SPEAROW
	const PAL_FEAROW
	const PAL_EXEGGCUTE
	const PAL_EXEGGUTOR
	const PAL_NIDORAN_F
	const PAL_NIDORINA
	const PAL_NIDOQUEEN
	const PAL_NIDORAN_M
	const PAL_NIDORINO
	const PAL_NIDOKING
	const PAL_MEOWTH
	const PAL_PERSIAN
	const PAL_PSYDUCK
	const PAL_GOLDUCK
	const PAL_MANKEY
	const PAL_PRIMEAPE
	const PAL_VENONAT
	const PAL_VENOMOTH
	const PAL_GROWLITHE
	const PAL_ARCANINE
	const PAL_CATERPIE
	const PAL_METAPOD
	const PAL_BUTTERFREE
	const PAL_WEEDLE
	const PAL_KAKUNA
	const PAL_BEEDRILL
	const PAL_PIKACHU
	const PAL_RAICHU
	const PAL_VULPIX
	const PAL_NINETALES
	const PAL_JIGGLYPUFF
	const PAL_WIGGLYTUFF
	const PAL_ZUBAT
	const PAL_GOLBAT
	const PAL_GEODUDE
	const PAL_GRAVELER
	const PAL_GOLEM
	const PAL_PARAS
	const PAL_PARASECT
	const PAL_CLEFAIRY
	const PAL_CLEFABLE
	const PAL_RHYHORN
	const PAL_RHYDON
	const PAL_SANDSHREW
	const PAL_SANDSLASH
	const PAL_POLIWAG
	const PAL_POLIWHIRL
	const PAL_POLIWRATH
	const PAL_EKANS
	const PAL_ARBOK
	const PAL_FARFETCHD
	const PAL_ODDISH
	const PAL_GLOOM
	const PAL_VILEPLUME
	const PAL_BELLSPROUT
	const PAL_WEEPINBELL
	const PAL_VICTREEBEL
	const PAL_EEVEE
	const PAL_VAPOREON
	const PAL_JOLTEON
	const PAL_FLAREON
	const PAL_ABRA
	const PAL_KADABRA
	const PAL_ALAKAZAM
	const PAL_GOLDEEN
	const PAL_SEAKING
	const PAL_STARYU
	const PAL_STARMIE
	const PAL_SLOWPOKE
	const PAL_SLOWBRO
	const PAL_TANGELA
	const PAL_LICKITUNG
	const PAL_SHELLDER
	const PAL_CLOYSTER
	const PAL_PONYTA
	const PAL_RAPIDASH
	const PAL_DROWZEE
	const PAL_HYPNO
	const PAL_DODUO
	const PAL_DODRIO
	const PAL_MAGNEMITE
	const PAL_MAGNETON
	const PAL_DIGLETT
	const PAL_DUGTRIO
	const PAL_TAUROS
	const PAL_MACHOP
	const PAL_MACHOKE
	const PAL_MACHAMP
	const PAL_HITMONLEE
	const PAL_HITMONCHAN
	const PAL_MR_MIME
	const PAL_MAGIKARP
	const PAL_GYARADOS
	const PAL_GRIMER
	const PAL_MUK
	const PAL_KOFFING
	const PAL_WEEZING
	const PAL_PORYGON
	const PAL_GASTLY
	const PAL_HAUNTER
	const PAL_GENGAR
	const PAL_CUBONE
	const PAL_MAROWAK
	const PAL_CHANSEY
	const PAL_VOLTORB
	const PAL_ELECTRODE
	const PAL_PINSIR
	const PAL_SCYTHER
	const PAL_DITTO
	const PAL_HORSEA
	const PAL_SEADRA
	const PAL_ONIX
	const PAL_KANGASKHAN
	const PAL_ELECTABUZZ
	const PAL_SNORLAX
	const PAL_TENTACOOL
	const PAL_TENTACRUEL
	const PAL_KRABBY
	const PAL_KINGLER
	const PAL_LAPRAS
	const PAL_JYNX
	const PAL_SEEL
	const PAL_DEWGONG
	const PAL_MAGMAR
	const PAL_OMANYTE
	const PAL_OMASTAR
	const PAL_KABUTO
	const PAL_KABUTOPS
	const PAL_AERODACTYL
	const PAL_DRATINI
	const PAL_DRAGONAIR
	const PAL_DRAGONITE
	const PAL_ARTICUNO
	const PAL_ZAPDOS
	const PAL_MOLTRES
	const PAL_MEWTWO
	const PAL_MEW
DEF NUM_SGB_PALS EQU const_value
