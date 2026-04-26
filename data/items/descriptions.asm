ItemDescriptions:
    table_width 2
    dw MasterBallDescription
	dw UltraBallDescription
    dw GreatBallDescription 
    dw PokeBallDescription
	dw TownMapDescription
	dw BicycleDescription
	dw SurfboardDescription
	dw SafariBallDescription
	dw PokedexDescription
	dw MoonStoneDescription
	dw NoItemDescription ; UNUSED_0B (ANTIDOTE)
	dw NoItemDescription ; UNUSED_0C (BURN_HEAL) 
	dw NoItemDescription ; UNUSED_0D (ICE_HEAL)
	dw NoItemDescription ; UNUSED_0E (AWAKENING)
	dw NoItemDescription ; UNUSED_0F (PARALYZE_HEAL)
	dw FullRestoreDescription
	dw MaxPotionDescription
	dw HyperPotionDescription
	dw SuperPotionDescription
	dw PotionDescription
	dw BoulderBadgeDescription
	dw CascadeBadgeDescription
	dw ThunderBadgeDescription
	dw RainbowBadgeDescription
	dw SoulBadgeDescription
	dw MarshBadgeDescription
	dw VolcanoBadgeDescription
	dw EarthBadgeDescription
	dw EscapeRopeDescription
	dw RepelDescription
	dw OldAmberDescription
	dw FireStoneDescription
	dw ThunderStoneDescription
	dw WaterStoneDescription
	dw HPUpDescription
	dw ProteinDescription
	dw IronDescription
	dw CarbosDescription
	dw CalciumDescription
	dw RareCandyDescription
	dw DomeFossilDescription
	dw HelixFossilDescription
	dw NoItemDescription ; UNUSED_2B (SECRET_KEY)
	dw AncientHairDescription
	dw BikeVoucherDescription
	dw NoItemDescription ; UNUSED_2E (X_ACCURACY)
	dw LeafStoneDescription
	dw NoItemDescription ; UNUSED_30 (CARD_KEY)
	dw NuggetDescription
	dw DevoSprayDescription ; (ITEM_32)
	dw PokeDollDescription
	dw PanaceaDescription
	dw ReviveDescription
	dw MaxReviveDescription
	dw TeaShipmentDescription ; TEA_SHIPMENT (GUARD_SPEC)
	dw NoItemDescription ; UNUSED_38 (SUPER_REPEL)
	dw NoItemDescription ; UNUSED_39 (MAX_REPEL)
	dw NoItemDescription ; UNUSED_3A (DIRE_HIT)
	dw NoItemDescription ; COIN
	dw FreshWaterDescription
	dw IcedTeaDescription
	dw LemonadeDescription
	dw NoItemDescription ; UNUSED_3F (SS_TICKET)
	dw GoldTeethDescription
	dw NoItemDescription ; UNUSED_41 (X_ATTACK)
	dw NoItemDescription ; UNUSED_42 (X_DEFEND)
	dw NoItemDescription ; UNUSED_43 (X_SPEED)
	dw NoItemDescription ; UNUSED_44 (X_SPECIAL)
	dw CoinCaseDescription
	dw OaksParcelDescription
	dw ItemfinderDescription
	dw NoItemDescription ; UNUSED_48 (SILPH SCOPE)
	dw PokeFluteDescription
	dw NoItemDescription ; UNUSED_4A (LIFT_KEY)
	dw ExpAllDescription
	dw NoItemDescription ; UNUSED_4C (OLD_ROD)
	dw NoItemDescription ; UNUSED_4D (GOOD_ROD)
	dw FishingRodDescription
	dw PPUpDescription
	dw EtherDescription
	dw MaxEtherDescription
	dw ElixirDescription
	dw MaxElixirDescription
	dw NoItemDescription ; FloorB2F
	dw NoItemDescription ; FloorB1F
	dw NoItemDescription ; Floor1F
	dw NoItemDescription ; Floor2F
	dw NoItemDescription ; Floor3F
	dw NoItemDescription ; Floor4F
	dw NoItemDescription ; Floor5F
	dw NoItemDescription ; Floor6F
	dw NoItemDescription ; Floor7F
	dw NoItemDescription ; Floor8F
	dw NoItemDescription ; Floor9F
	dw NoItemDescription ; Floor10F
	dw NoItemDescription ; Floor11F
	dw NoItemDescription ; FloorB4F
	dw CutDescription
	dw FlyDescription
	dw SurfDescription
	dw StrengthDescription
	dw FlashDescription
	dw MegaPunchDescription
	dw RazorWindDescription
	dw SwordsDanceDescription
	dw HeadbuttDescription
	dw TeleportDescription
	dw ToxicDescription
	dw FirePunchDescription
	dw IcePunchDescription
	dw ThunderPunchDescription
	dw RazorLeafDescription
	dw BubblebeamDescription
	dw DoubleKickDescription
	dw IceBeamDescription
	dw ThunderWaveDescription
	dw HyperBeamDescription
	dw LightScreenDescription
	dw ReflectDescription
	dw AgilityDescription
	dw SubmissionDescription
	dw CrunchDescription
	dw MegaDrainDescription
	dw SolarBeamDescription
	dw DragonBreathDescription
	dw ThunderboltDescription
	dw WaterfallDescription
	dw EarthquakeDescription
	dw FocusEnergyDescription
	dw DigDescription
	dw PsychicMDescription
	dw PsywaveDescription
	dw MimicDescription
	dw DoubleDashDescription
	dw ShadowTearDescription
	dw BideDescription
	dw FlamethrowerDescription
	dw SludgeDescription
	dw BugBuzzDescription
	dw FlareRushDescription
	dw SwiftDescription
	dw SkullBashDescription
	dw HypnosisDescription
	dw DreamEaterDescription
	dw VenomStrikeDescription
	dw RestDescription
	dw MoonblastDescription
	dw PayDayDescription
	dw HeavySmashDescription
	dw RockSlideDescription
	dw TwinSliceDescription
	dw SubstituteDescription
	dw MetronomeDescription

MasterBallDescription:
    db "Catch wild #MON"
    feed "without fail.@"

UltraBallDescription:
    db "Better catch chance"
    feed "than a GREAT BALL.@"

GreatBallDescription:
    db "Better catch chance"
    feed "than a # BALL.@"

PokeBallDescription:
    db "Tool used to catch"
    feed "wild #MON.@"

TownMapDescription:
    db "You should not see"
    feed "this in-game.@"

BicycleDescription:
    db "The fastest way to"
    feed "travel!@"

SurfboardDescription:
    db "Allows you to surf"
    feed "on water.@"

SafariBallDescription:
    db "A ball for use in"
    feed "the SAFARI ZONE.@"

PokedexDescription:
    db "High-tech #MON"
    feed "encyclopedia.@"

MoonStoneDescription:
FireStoneDescription:
ThunderStoneDescription:
WaterStoneDescription:
LeafStoneDescription:
    db "Evolves certain"
    feed "kinds of #MON.@"

FullRestoreDescription:
    db "Fully restores HP"
    feed "and status.@"

MaxPotionDescription:
    db "Fully restores HP"
    feed "of a #MON.@"

HyperPotionDescription:
    db "Restores up to 200"
    feed "HP of a #MON.@"

SuperPotionDescription:
    db "Restores up to 100"
    feed "HP of a #MON.@"

PotionDescription:
    db "Restores up to 50"
    feed "HP of a #MON.@"

BoulderBadgeDescription:
CascadeBadgeDescription:
ThunderBadgeDescription:
RainbowBadgeDescription:
SoulBadgeDescription:
MarshBadgeDescription:
VolcanoBadgeDescription:
EarthBadgeDescription:
    db "A badge received"
    feed "from a GYM LEADER.@"

EscapeRopeDescription:
    db "Rope that enables"
    feed "escape from caves.@"

RepelDescription:
    db "Repel weak #MON"
    feed "for 250 steps.@"

OldAmberDescription:
    db "Old resin with DNA"
    feed "from a #MON.@"

HPUpDescription:
    db "Raises a #MON's"
    feed "maximum HP.@"

ProteinDescription:
    db "Raises a #MON's"
    feed "Attack stat.@"

IronDescription:
    db "Raises a #MON's"
    feed "Defense stat.@"

CarbosDescription:
    db "Raises a #MON's"
    feed "Speed stat.@"

CalciumDescription:
    db "Raises a #MON's"
    feed "Special stat.@"  

RareCandyDescription:
    db "Raises a #MON's"
    feed "level by one.@"

DomeFossilDescription:
HelixFossilDescription:
    db "Fossilized remains"
    feed "of a #MON.@"

AncientHairDescription:
    db "Ancient hair from"
    feed "a rare #MON.@"

BikeVoucherDescription:
    db "Exchange for free"
    feed "BICYCLE.@"

NuggetDescription:
    db "A golden nugget to"
    feed "sell to shops.@"

DevoSprayDescription:
    db "Spray that reverts"
    feed "#MON evolution.@"

PokeDollDescription:
    db "Use to escape from"
    feed "wild #MON.@"

PanaceaDescription:
    db "Cures any status"
    feed "problem.@"

ReviveDescription:
    db "Revive a #MON"
    feed "to 1/2 HP.@"

MaxReviveDescription:
    db "Revive a #MON"
    feed "to full HP.@"

TeaShipmentDescription:
	db "A case of bottled"
	feed "homemade tea.@"

FreshWaterDescription:
    db "Restores 25 HP of"
    feed "a #MON.@"

IcedTeaDescription:
    db "Restores 50 HP of"
    feed "a #MON.@"

LemonadeDescription:
    db "Restores 75 HP of"
    feed "a #MON.@"

GoldTeethDescription:
    db "Shiny gold teeth,"
    feed "kinda gross.@"

CoinCaseDescription:
    db "Holds up to 9999"
    feed "COINS.@"

OaksParcelDescription:
    db "A parcel for"
    feed "PROFFESSOR OAK.@"

ItemfinderDescription:
    db "Finds hidden"
    feed "items nearby.@"

PokeFluteDescription:
    db "Wakes #MON from"
    feed "sleep.@"

ExpAllDescription:
    db "Gives all #MON"
    feed "in party EXP.@"

FishingRodDescription:
    db "A rod for fishing"
    feed "for #MON.@"

PPUpDescription:
    db "Raises PP of a"
    feed "#MON's move.@"

EtherDescription:
    db "Restores 10 PP of"
    feed "a #MON's move.@"

MaxEtherDescription:
    db "Restores all PP of"
    feed "a #MON's move.@"

ElixirDescription:
    db "Restores 10 PP of"
    feed "all #MON moves.@"

MaxElixirDescription:
    db "Restores all PP of"
    feed "all #MON moves.@"

NoItemDescription:
    db "This item is"
    feed "not in use.@"