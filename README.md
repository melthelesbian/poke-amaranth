# Pokémon Amaranth

Pokémon Amaranth is a reimagining of the first generation of Pokémon, with the aim of exploring what could have been done with the basic gameplay systems and engine of Pokémon Red & Blue if they had followed a different design philosophy. While many cosmetic and informational quality-of-life changes have been added, and I have made a number of drastic non-canon changes to the moves, types, pokémon, and maps, I've tried not to make too many changes to the underlying battle engine or core gameplay systems, in order to retain some of the spirit of the originals, warts and all.

## Mechanical Features

* Choose between `CUTE` (Leaf) and `COOL` (Red) styles at character creation.
* Hold `B` to go fast.
* `CUT` and `SURF` on the overworld, no menus necessary.
* Increased `BAG` and `PC` capacity.
* Sort all the items in your bag automatically by pressing `START` while the bag is open.
* The `TOWN MAP` is integrated into the start menu, rather than taking up space in your bag.
* In-battle caught icon & exp bar
* More detailed move information display during battle.
* Move detail popup while learning a new move.
* View learnsets, types, evolution methods and base stats in the Pokédex.
* Prompt to use additional `REPEL` when the used one wears off.
* Individualized per-pokémon palettes in SGB mode.
* Modest improvement to the effectiveness of the `EXP ALL` 

## Content Changes

* Completely overhauled base stat spreads, exp yields, catch rates, typings, learnsets, and wild encounters. Every pokémon has been changed at least a little bit, hopefully you'll agree for the better.
* Added `DARK`, `STEEL`, and `FAIRY` types, and seeded them across the existing 151 Pokémon.
* Created several new areas, including a new pseudo-gym in Vermillion City, the `BUG SANCTUARY`.
* Non-Linear progression: the map opens up once you reach Cerulean City, making many side areas optional, feel free to explore locations early if you think you're strong enough.
* You get the equivalent of the Super Rod early in the game at the house of a new Fishing Guru. Take it and fish, young one!
* Many items have been combined or removed, taking up fewer bag slots, which means less work for you.
* Removed `EVASION` raising and `ACCURACY` lowering moves, alongside general buffs across the board to speed up combat and make it hit harder.
* `HM` moves have been changed and any should be good additions to the right Pokémon.
* Curated selection of front & back sprites combining some of the best sprites from RG, RBY, GSC, Spaceworld '97, and some other talented artists (see [CREDITS](docs/CREDITS.md))
* Most Pokémon lines can be acquired before reaching Fuchsia City. Keep an eye out for new in-game trades, and remember to explore for hidden and optional areas if you want to find your favorite.
* New Item: De-Evolution Spray (`DEVO_SPRAY` for short) does just what it says, whether you're trying to fill in a spot in your Pokédex, learn a move early, or just regret evolving one of your 'mons, you have options now.

## Battle Engine Changes

I really did try to keep these to a minimum, but the following changes were more or less unavoidable:

* Fixed a bug that caused misreporting of Super Effective and Not Very Effective attacks on dual-type Pokémon. With the changes made to move and pokémon types, it would have been too confusing to leave this glitch in.
* Fixed the bug causing Focus Energy not to work, this is important to help certain crit-focused Pokémon remain viable without speed buffs.
* Fixed the bug causing permanent invulnerability if a digging or flying Pokémon was interrupted by paralysis or confusion before concluding their attack, this isn't deliberately exploitable in a fun way and could cause serious gameplay issues.
* Altered the sleep mechanics to allow attacking on the turn which you wake up. It was impossible to balance the sleep moves without this change, especially in light of the removal of accuracy-lowering moves, sleep is still powerful, but not entirely game-breaking.

## Acknowledgements

See [CREDITS](docs/CREDITS.md) and [pret's original README](docs/PRET.md)