MoveDescriptions:
	table_width 2, MoveDescriptions
	dw PoundDescription
	dw KarateChopDescription
	dw DoubleSlapDescription
	dw DragonBreathDescription
	dw MegaPunchDescription
	dw PayDayDescription
	dw FirePunchDescription
	dw IcePunchDescription
	dw ThunderPunchDescription
	dw ScratchDescription
	dw CrushDescription
	dw GuillotineDescription
	dw RazorWindDescription
	dw SwordsDanceDescription
	dw CutDescription
	dw GustDescription
	dw WingAttackDescription
	dw IcyWindDescription
	dw FlyDescription
	dw FeintAttackDescription
	dw HeavySmashDescription
	dw VineWhipDescription
	dw AstonishDescription
	dw DoubleKickDescription
	dw MoonblastDescription
	dw JumpKickDescription
	dw RollingKickDescription
	dw MudSlapDescription
	dw HeadbuttDescription
	dw HornAttackDescription
	dw FuryCutDescription
	dw BugBuzzDescription
	dw TackleDescription
	dw BodySlamDescription
	dw WrapDescription
	dw TakeDownDescription
	dw ThrashDescription
	dw FlareRushDescription
	dw TailWhipDescription
	dw PoisonStingDescription
	dw TwineedleDescription
	dw BugBiteDescription
	dw LeerDescription
	dw BiteDescription
	dw GrowlDescription
	dw FrightenDescription
	dw SingDescription
	dw SweetCryDescription
	dw SonicBoomDescription
	dw DisableDescription
	dw AcidDescription
	dw EmberDescription
	dw FlamethrowerDescription
	dw MistDescription
	dw WaterGunDescription
	dw HydroPumpDescription
	dw SurfDescription
	dw IceBeamDescription
	dw BlizzardDescription
	dw PsybeamDescription
	dw BubblebeamDescription
	dw AuroraBeamDescription
	dw HyperBeamDescription
	dw PeckDescription
	dw DrillPeckDescription
	dw SubmissionDescription
	dw LowKickDescription
	dw CounterDescription
	dw SeismicTossDescription
	dw StrengthDescription
	dw AbsorbDescription
	dw MegaDrainDescription
	dw LeechSeedDescription
	dw GrowthDescription
	dw RazorLeafDescription
	dw SolarBeamDescription
	dw PoisonCloudDescription
	dw StunCloudDescription
	dw SleepCloudDescription
	dw PetalDanceDescription
	dw StringShotDescription
	dw DragonRageDescription
	dw FireSpinDescription
	dw ThundershockDescription
	dw ThunderboltDescription
	dw ThunderWaveDescription
	dw ThunderDescription
	dw RockThrowDescription
	dw EarthquakeDescription
	dw FissureDescription
	dw DigDescription
	dw ToxicDescription
	dw ConfusionDescription
	dw PsychicMDescription
	dw HypnosisDescription
	dw PrepareDescription
	dw AgilityDescription
	dw QuickAttackDescription
	dw RageDescription
	dw TeleportDescription
	dw NightShadeDescription
	dw MimicDescription
	dw ScreechDescription
	dw DoubleDashDescription
	dw RecoverDescription
	dw SparkDescription
	dw MinimizeDescription
	dw SmokescreenDescription
	dw ConfuseRayDescription
	dw FlameChargeDescription
	dw DefenseCurlDescription
	dw BarrierDescription
	dw LightScreenDescription
	dw HazeDescription
	dw ReflectDescription
	dw FocusEnergyDescription
	dw BideDescription
	dw MetronomeDescription
	dw MirrorMoveDescription
	dw SelfDestructDescription
	dw EggBombDescription
	dw LickDescription
	dw SmogDescription
	dw SludgeDescription
	dw BoneClubDescription
	dw FireBlastDescription
	dw WaterfallDescription
	dw WhirlpoolDescription
	dw SwiftDescription
	dw SkullBashDescription
	dw SpikeCannonDescription
	dw NightSlashDescription
	dw AmnesiaDescription
	dw KinesisDescription
	dw SoftBoiledDescription
	dw HiJumpKickDescription
	dw GlareDescription
	dw DreamEaterDescription
	dw VenomStrikeDescription
	dw BarrageDescription
	dw LeechLifeDescription
	dw DrainKissDescription
	dw SkyAttackDescription
	dw TransformDescription
	dw BubbleDescription
	dw DizzyPunchDescription
	dw SporeDescription
	dw FlashDescription
	dw PsywaveDescription
	dw SplashDescription
	dw PowderSnowDescription
	dw CrabhammerDescription
	dw ExplosionDescription
	dw FurySwipesDescription
	dw BonemerangDescription
	dw RestDescription
	dw RockSlideDescription
	dw CrunchDescription
	dw ShadowTearDescription
	dw ConversionDescription
	dw TriAttackDescription
	dw SuperFangDescription
	dw SlashDescription
	dw SubstituteDescription
	dw StruggleDescription
	assert_table_length NUM_ATTACKS

PoundDescription:
	db "Pounds foe with a"
	feed "fore-limb.@"

KarateChopDescription:
	db "Hits foe with arm."
	feed "High crit chance.@"

DoubleSlapDescription:
	db "Slap at the foe."
	feed "Hits twice.@"

DragonBreathDescription:
	db "Big breath attack."
	feed "May paralyze foe.@"

MegaPunchDescription:
	db "Hits the foe with"
	feed "a powerful punch.@"

PayDayDescription:
	db "Conjures coins to"
	feed "pelt the foe.@"

FirePunchDescription:
	db "A fiery punch."
	feed "May burn foe.@"

IcePunchDescription:
	db "A freezing punch."
	feed "May freeze foe.@"

ThunderPunchDescription:
	db "A shocking punch."
	feed "May paralyze foe.@"

ScratchDescription:
	db "Scratches foe with"
	feed "claws or talons.@"

CrushDescription:
	db "Crushes foe in an"
	feed "iron-like grip.@"

GuillotineDescription:
	db "Charge a strike to"
	feed "devastate the foe.@"

RazorWindDescription:
	db "Cut the foe with a"
	feed "razor-sharp wind.@"

SwordsDanceDescription:
	db "A fighter's dance."
	feed "Sharply raise ATK.@"

CutDescription:
	db "Slices at the foe."
	feed "Can cut shrubs.@"

GustDescription:
	db "A gust of wind."
	feed "May lower foe SPD.@"

WingAttackDescription:
	db "Strikes foe with"
	feed "spread wings.@"

IcyWindDescription:
	db "Burst of icy wind."
	feed "May lower foe SPD.@"

FlyDescription:
	db "Flies up high."
	feed "Strikes next turn.@"

FeintAttackDescription:
	db "Tricks the foe."
	feed "Always hits.@"

HeavySmashDescription:
	db "A weighty smash."
	feed "May paralyze foe.@"

VineWhipDescription:
	db "Whips the foe with"
	feed "vines.@"

AstonishDescription:
	db "A shocking blow."
	feed "Foe may flinch.@"

DoubleKickDescription:
	db "Kicks the foe."
	feed "Hits twice.@"

MoonblastDescription:
	db "Fires moon energy."
	feed "May lower foe SPC.@"

JumpKickDescription:
	db "May miss kick and"
	feed "hurt the user.@"

RollingKickDescription:
	db "A rolling kick."
	feed "Foe may flinch.@"

MudSlapDescription:
	db "Slaps with mud to"
	feed "hurt the foe.@"

HeadbuttDescription:
	db "A strong headbutt"
	feed "Foe may flinch.@"

HornAttackDescription:
	db "A sturdy horn that"
	feed "bludgeons the foe.@"

FuryCutDescription:
	db "If a foe strikes,"
	feed "sharply raise ATK.@"

BugBuzzDescription:
	db "A painful buzzing."
	feed "May lower foe SPC.@"

TackleDescription:
	db "A full-body charge"
	feed "attack.@"

BodySlamDescription:
	db "A bodily slam."
	feed "May paralyze foe.@"

WrapDescription:
	db "Squeezes the foe."
	feed "Lasts 2-5 turns.@"

TakeDownDescription:
	db "A bold take down."
	feed "Hurts the user.@"

ThrashDescription:
	db "Thrash 2-3 turns."
	feed "Confuses the user.@"

FlareRushDescription:
	db "A blazing tackle."
	feed "Hurts the user.@"

TailWhipDescription:
	db "A hard tail swipe."
	feed "May lower foe DEF.@"

PoisonStingDescription:
	db "A stinging attack."
	feed "May poison foe.@"

TwineedleDescription:
	db "Stabbing stingers."
	feed "May poison foe.@"

BugBiteDescription:
	db "A bug's biting"
	feed "attack.@"

LeerDescription:
	db "A menacing leer."
	feed "Lowers foe DEF.@"

BiteDescription:
	db "Tough bite attack."
	feed "Foe may flinch.@"

GrowlDescription:
	db "An adorable growl."
	feed "Lowers foe ATK.@"

FrightenDescription:
	db "Scares wild foes"
	feed "into fleeing.@"

SingDescription:
	db "Sings a lullaby."
	feed "Puts foe to sleep.@"

SweetCryDescription:
	db "Cries disarmingly."
	feed "May lower foe ATK.@"

SonicBoomDescription:
	db "Sonic wave attack."
	feed "Deals 20 damage.@"

DisableDescription:
	db "Disable a foe's"
	feed "move at random.@"

AcidDescription:
	db "Attacks with acid."
	feed "May burn foe.@"

EmberDescription:
	db "Attacks with fire."
	feed "May burn foe.@"

FlamethrowerDescription:
	db "Strong fire burst."
	feed "May burn foe.@"

MistDescription:
	db "Protects user from"
	feed "stat-loss moves.@"

WaterGunDescription:
	db "Shoots water at"
	feed "the foe.@"

HydroPumpDescription:
	db "A powerful blast"
	feed "of water.@"

SurfDescription:
	db "Hits foe with a"
	feed "powerful wave.@"

IceBeamDescription:
	db "Fires beam of ice."
	feed "May freeze foe.@"

BlizzardDescription:
	db "Bury foe in snow."
	feed "May freeze foe.@"

PsybeamDescription:
	db "Psychic ray blast."
	feed "May confuse foe.@"

BubblebeamDescription:
	db "Stream of bubbles."
	feed "May lower foe SPD.@"

AuroraBeamDescription:
	db "A beautiful beam."
	feed "May lower foe ATK.@"

HyperBeamDescription:
	db "An intense blast."
	feed "User must recover.@"

PeckDescription:
	db "Pecks with beak."
	feed "Foe may flinch.@"

DrillPeckDescription:
	db "A powerful pecking"
	feed "attack.@"

SubmissionDescription:
	db "A full-body throw."
	feed "Hurts the user.@"

LowKickDescription:
	db "A sweeping kick."
	feed "May lower foe ATK.@"

CounterDescription:
	db "Counters the foe's"
	feed "last attack.@"

SeismicTossDescription:
	db "Deals damage equal"
	feed "to user's level.@"

StrengthDescription:
	db "A powerful strike."
	feed "Can move boulders.@"

AbsorbDescription:
	db "Drain's foe's HP."
	feed "Heals the user.@"

MegaDrainDescription:
	db "Drain's foe's HP."
	feed "Heals the user.@"

LeechSeedDescription:
	db "Steals HP from foe"
	feed "once each turn.@"

GrowthDescription:
	db "User's body grows."
	feed "Raise SPC.@"

RazorLeafDescription:
	db "Sharp leaf attack."
	feed "High crit chance.@"

SolarBeamDescription:
	db "Charge solar rays"
	feed "to blast the foe.@"

PoisonCloudDescription:
	db "A poisonous cloud."
	feed "Poisons foe.@"

StunCloudDescription:
	db "A stunning cloud."
	feed "Paralyzes foe.@"

SleepCloudDescription:
	db "A soothing cloud."
	feed "Puts foe to sleep.@"

PetalDanceDescription:
	db "Dances 2-3 turns."
	feed "Confuses the user.@"

StringShotDescription:
	db "A string attack."
	feed "May paralyze foe.@"

DragonRageDescription:
	db "Shockwave attack."
	feed "Deals 40 damage.@"

FireSpinDescription:
	db "A fiery vortex."
	feed "Lasts 2-5 turns.@"

ThundershockDescription:
	db "An electric jolt."
	feed "May paralyze foe.@"

ThunderboltDescription:
	db "An electric jolt."
	feed "May paralyze foe.@"

ThunderWaveDescription:
	db "Electric shock."
	feed "Paralyzes foe.@"

ThunderDescription:
	db "Calls lightning."
	feed "May paralyze foe.@"

RockThrowDescription:
	db "Tosses rocks at"
	feed "the foe.@"

EarthquakeDescription:
	db "A powerful ground-"
	feed "shaking strike.@"

FissureDescription:
	db "Rips up the earth."
	feed "Faints the user.@"

DigDescription:
	db "Digs underground."
	feed "Strikes next turn.@"

ToxicDescription:
	db "Sprays with toxin."
	feed "Badly poisons foe.@"

ConfusionDescription:
	db "Psychic attack."
	feed "May confuse foe.@"

PsychicMDescription:
	db "Attacks the mind."
	feed "May lower foe SPC.@"

HypnosisDescription:
	db "A hypnotic move."
	feed "Puts foe to sleep.@"

PrepareDescription:
	db "Readies the body."
	feed "Raise ATK.@"

AgilityDescription:
	db "Relaxes the body."
	feed "Sharply raise SPD.@"

QuickAttackDescription:
	db "A fast strike."
	feed "Always goes first.@"

RageDescription:
	db "If a foe strikes,"
	feed "sharply raise ATK.@"

TeleportDescription:
	db "Teleport user away"
	feed "from wild foes.@"

NightShadeDescription:
	db "Deals damage equal"
	feed "to user's level.@"

MimicDescription:
	db "Pick a foe's move"
	feed "and copy it.@"

ScreechDescription:
	db "A loud screech."
	feed "Sharply lower DEF.@"

DoubleDashDescription:
	db "A dashing strike."
	feed "Hits twice.@"

RecoverDescription:
	db "A soothing move."
	feed "Heals the user.@"

SparkDescription:
	db "Sparking attack."
	feed "May paralyze foe.@"

MinimizeDescription:
	db "Shrinks the body."
	feed "Sharply raise SPC.@"

SmokescreenDescription:
	db "Blinding smoke."
	feed "Confuses foe.@"

ConfuseRayDescription:
	db "Disorienting ray."
	feed "Confuses foe.@"

FlameChargeDescription:
	db "A fiery tackle."
	feed "May confuse foe.@"

DefenseCurlDescription:
	db "Curls defensively."
	feed "Raise DEF.@"

BarrierDescription:
	db "Creates a barrier."
	feed "Sharply raise DEF.@"

LightScreenDescription:
	db "Doubles SPC when"
	feed "hit by SPC moves.@"

HazeDescription:
	db "Reset stat-change"
	feed "effects.@"

ReflectDescription:
	db "Doubles DEF when"
	feed "hit by PHYS moves.@"

FocusEnergyDescription:
	db "User focuses body."
	feed "Raise crit chance.@"

BideDescription:
	db "Wait 2 turns, then"
	feed "double damage.@"

MetronomeDescription:
	db "Randomly uses a"
	feed "move.@"

MirrorMoveDescription:
	db "Attack foe with"
	feed "their last move.@"

SelfDestructDescription:
	db "Causes explosion."
	feed "Faints the user.@"

EggBombDescription:
	db "Throws explosive"
	feed "eggs at foe.@"

LickDescription:
	db "Licking attack."
	feed "May paralyze foe.@"

SmogDescription:
	db "Pump toxic smog."
	feed "May poison foe.@"

SludgeDescription:
	db "Toss toxic sludge."
	feed "May poison foe.@"

BoneClubDescription:
	db "Smash foe with bone."
	feed "Foe may flinch.@"

FireBlastDescription:
	db "Strong fire blast."
	feed "May burn foe.@"

WaterfallDescription:
	db "A watery strike."
	feed "Foe may flinch.@"

WhirlpoolDescription:
	db "A watery spiral."
	feed "Lasts 2-5 turns.@"

SwiftDescription:
	db "A swift attack."
	feed "Always hits.@"

SkullBashDescription:
	db "Charge energy to"
	feed "smash the foe.@"

SpikeCannonDescription:
	db "Shoot hard spikes."
	feed "Hits 2-5 times.@"

NightSlashDescription:
	db "A sneaky slash."
	feed "High crit chance.@"

AmnesiaDescription:
	db "A mental block."
	feed "Sharply raise SPC.@"

KinesisDescription:
	db "Psychic barrage."
	feed "Foe may flinch.@"

SoftBoiledDescription:
	db "Nourish the body."
	feed "Heals the user.@"

HiJumpKickDescription:
	db "May miss kick and"
	feed "hurt the user.@"

GlareDescription:
	db "A menacing glare."
	feed "Paralyzes foe.@"

DreamEaterDescription:
	db "Drains HP from"
	feed "sleeping foe.@"

VenomStrikeDescription:
	db "Venomous strike."
	feed "High crit chance.@"

BarrageDescription:
	db "Rapid seed attack."
	feed "Hits 2-5 times.@"

LeechLifeDescription:
	db "Saps the foe's HP."
	feed "Heals the user.@"

DrainKissDescription:
	db "Sucks HP from foe."
	feed "Heals the user.@"

SkyAttackDescription:
	db "Charges air strike"
	feed "against the foe.@"

TransformDescription:
	db "Transforms body"
	feed "to become foe.@"

BubbleDescription:
	db "Shoots bubbles."
	feed "Hits 2-5 times.@"

DizzyPunchDescription:
	db "Punches 2-3 turns."
	feed "Confuses the user.@"

SporeDescription:
	db "Releases spores."
	feed "Puts foe to sleep.@"

FlashDescription:
	db "A blinding flash."
	feed "May confuse foe.@"

PsywaveDescription:
	db "Psychic waves."
	feed "Random damage.@"

SplashDescription:
	db "Splashes about."
	feed "@"

PowderSnowDescription:
	db "A snowy attack."
	feed "May freeze foe.@"

CrabhammerDescription:
	db "Hits with claws."
	feed "High crit chance.@"

ExplosionDescription:
	db "Creates explosion."
	feed "Faints the user.@"

FurySwipesDescription:
	db "Swipes at the foe."
	feed "Hits 2-5 times.@"

BonemerangDescription:
	db "Toss a bonemerang."
	feed "Hits twice.@"

RestDescription:
	db "Goes to sleep."
	feed "Heals the user.@"

RockSlideDescription:
	db "Pelts foe with a"
	feed "rockslide.@"

CrunchDescription:
	db "Crunches the foe."
	feed "May lower foe DEF.@"

ShadowTearDescription:
	db "Tears at the foe."
	feed "High crit chance.@"

ConversionDescription:
	db "Switch type to"
	feed "match the foe.@"

TriAttackDescription:
	db "Fires three beams."
	feed "Neutral damage.@"

SuperFangDescription:
	db "Cuts foe's HP by"
	feed "half.@"

SlashDescription:
	db "A powerful slash."
	feed "High crit chance.@"

SubstituteDescription:
	db "Cuts HP by 1/4 and"
	feed "provides a decoy.@"

StruggleDescription:
	db "Struggle is real."
	feed "Hurts the user.@"
