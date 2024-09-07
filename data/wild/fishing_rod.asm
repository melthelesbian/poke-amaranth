; super rod encounters
FishingRodData:
	; map, fishing group
	dbw PALLET_TOWN,         .PalletTown
	dbw VIRIDIAN_CITY,       .ViridianCity
	dbw CERULEAN_CITY,       .CeruleanCity
	dbw VERMILION_CITY,      .VermilionCity
	dbw CELADON_CITY,        .CeladonCity
	dbw FUCHSIA_CITY,        .FuchsiaCity
	dbw CINNABAR_ISLAND,     .CinnabarIsland
	dbw ROUTE_4,             .Route4
	dbw ROUTE_6,             .Route6
	dbw ROUTE_10,            .Route10
	dbw ROUTE_11,            .Route11
	dbw ROUTE_12,            .Route12
	dbw ROUTE_13,            .Route13
	dbw ROUTE_17,            .Route17
	dbw ROUTE_18,            .Route18
	dbw ROUTE_19,            .Route19
	dbw ROUTE_20,            .Route20
	dbw ROUTE_21,            .Route21
	dbw ROUTE_22,            .Route22
	dbw ROUTE_23,            .Route23
	dbw ROUTE_24,            .Route24
	dbw ROUTE_25,            .Route25
	dbw CERULEAN_GYM,        .CeruleanCity
	dbw VERMILION_DOCK,      .VermilionCity
	dbw SEAFOAM_ISLANDS_B3F, .SeafoamIslandsB3F
	dbw SEAFOAM_ISLANDS_B4F, .SeafoamIslandsB4F
	dbw SAFARI_ZONE_EAST,    .SafariZoneEast
	dbw SAFARI_ZONE_NORTH,   .SafariZoneNorth
	dbw SAFARI_ZONE_WEST,    .SafariZoneWest
	dbw SAFARI_ZONE_CENTER,  .SafariZoneCenter
	dbw CERULEAN_CAVE_2F,    .CeruleanCave2F
	dbw CERULEAN_CAVE_B1F,   .CeruleanCaveB1F
	dbw CERULEAN_CAVE_1F,    .CeruleanCave1F
	dbw MT_MOON_SQUARE,      .MtMoonSquare
	dbw MEDITATION_CAVE,     .MeditationCave
	db -1 ; end

; fishing groups
; number of monsters, followed by level/monster pairs

.Group1:
.PalletTown:
.ViridianCity
	db 2
	db 15, TENTACOOL
	db 15, POLIWAG

.Group2:
.Route22:
	db 2
	db 15, GOLDEEN
	db 15, POLIWAG

.Group3:
.CeruleanCity:
.Route4:
.Route24:
.Route25:
.CeruleanGym:
	db 3
	db 15, PSYDUCK
	db 15, GOLDEEN
	db 15, KRABBY

.Group4:
.VermilionCity:
.Route6:
.Route11:
.VermilionDock:
	db 2
	db 15, KRABBY
	db 15, SHELLDER

.Group5:
.CeladonCity:
.Route10:
	db 2
	db 23, POLIWHIRL
	db 15, SLOWPOKE

.Group6:
.SafariZoneEast:
.SafariZoneNorth:
.SafariZoneWest:
.SafariZoneCenter:
.MtMoonSquare:
.MeditationCave:
	db 4
	db 15, DRATINI
	db 15, KRABBY
	db 15, PSYDUCK
	db 15, SLOWPOKE

.Group7:
.Route12:
.Route13:
.Route17:
.Route18:
	db 4
	db 5, TENTACOOL
	db 15, KRABBY
	db 15, GOLDEEN
	db 15, MAGIKARP

.Group8:
.CinnabarIsland:
.Route19:
.Route20:
.Route21:
.SeafoamIslandsB3F:
.SeafoamIslandsB4F:
	db 4
	db 15, STARYU
	db 15, HORSEA
	db 15, SHELLDER
	db 15, GOLDEEN

.Group9:
.Route23:
.CeruleanCave2F:
.CeruleanCaveB1F:
.CeruleanCave1F:
	db 4
	db 23, SLOWBRO
	db 23, SEAKING
	db 23, KINGLER
	db 23, SEADRA

.Group10:
.FuchsiaCity:
	db 4
	db 23, SEAKING
	db 15, KRABBY
	db 15, GOLDEEN
	db 15, MAGIKARP
