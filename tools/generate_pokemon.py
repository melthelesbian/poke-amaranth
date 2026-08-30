#!/usr/bin/env python3
"""Extract and generate Pokémon base-stat records."""

import json
import re
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
BASE_STATS = ROOT / "data/pokemon/base_stats"
SPECIES = ROOT / "data/pokemon/species"
EVOS_MOVES = ROOT / "data/pokemon/evos_moves"
DEX_ENTRIES = ROOT / "data/pokemon/dex_entries"
DEX_TEXT = ROOT / "data/pokemon/dex_text"
SPRITE_DECLARATIONS = (ROOT / "gfx/pics.asm", ROOT / "data/pokemon/mew.asm")
EXPECTED_COUNT = 151
REQUIRED_FIELDS = (
    "id",
    "asm_name",
    "sprites",
    "stats",
    "types",
    "catch_rate",
    "exp_yield",
    "level_1_moves",
    "growth_rate",
    "tmhm",
    "evolutions",
    "learnset",
    "pokedex",
)
STAT_FIELDS = ("hp", "attack", "defense", "speed", "special")
ALLOWED_FIELDS = set(REQUIRED_FIELDS)


def fail(message):
    raise ValueError(message)


def one(pattern, text, description, path):
    matches = re.findall(pattern, text, re.MULTILINE)
    if len(matches) != 1:
        fail(f"{path}: expected one {description}, found {len(matches)}")
    return matches[0]


def sprite_paths():
    paths = {}
    for declaration_path in SPRITE_DECLARATIONS:
        text = declaration_path.read_text()
        for label, path in re.findall(r'^\s*([A-Za-z0-9_.]+)::?\s+INCBIN\s+"([^"]+\.pic)"', text, re.MULTILINE):
            if label in paths and paths[label] != path:
                fail(f"{declaration_path}: duplicate sprite label {label}")
            paths[label] = path
    return paths


def evo_move_blocks():
    blocks = {}
    for path in EVOS_MOVES.glob("*.asm"):
        text = path.read_text()
        labels = list(re.finditer(r"^([A-Za-z0-9]+)EvosMoves:\s*$", text, re.MULTILINE))
        for index, match in enumerate(labels):
            end = labels[index + 1].start() if index + 1 < len(labels) else len(text)
            label = match.group(1)
            if label in blocks:
                fail(f"{path}: duplicate evolution/learnset label {label}")
            blocks[label] = text[match.end():end]
    return blocks


def dex_entry_blocks():
    blocks = {}
    for path in sorted(DEX_ENTRIES.glob("*.gen.asm")):
        text = path.read_text()
        match = re.search(r"^([A-Za-z0-9]+)DexEntry:\s*$", text, re.MULTILINE)
        if not match:
            fail(f"{path}: missing Pokédex entry label")
        label = match.group(1)
        if label in blocks:
            fail(f"{path}: duplicate Pokédex entry label {label}")
        blocks[label] = text[match.end():]
    return blocks


def dex_text_blocks():
    blocks = {}
    for path in sorted(DEX_TEXT.glob("*.gen.asm")):
        text = path.read_text()
        match = re.search(r"^_([A-Za-z0-9]+)DexEntry::\s*$", text, re.MULTILINE)
        if not match:
            fail(f"{path}: missing Pokédex text label")
        label = match.group(1)
        if label in blocks:
            fail(f"{path}: duplicate Pokédex text label {label}")
        blocks[label] = text[match.end():]
    return blocks


def parse_pokedex(asm_name, entry_blocks, text_blocks, path):
    if asm_name not in entry_blocks:
        fail(f"{path}: missing Pokédex entry for {asm_name}")
    if asm_name not in text_blocks:
        fail(f"{path}: missing Pokédex text for {asm_name}")
    entry_text = entry_blocks[asm_name]
    category = one(r'^\s*db "([^"]+)@"\s*$', entry_text, "Pokédex category", path)
    height = one(r"^\s*db (\d+),(\d+)\s*$", entry_text, "Pokédex height", path)
    weight = one(r"^\s*dw (\d+)\s*$", entry_text, "Pokédex weight", path)
    text_label = one(r"^\s*text_far _([A-Za-z0-9]+DexEntry)\s*$", entry_text, "Pokédex text pointer", path)
    if text_label != f"{asm_name}DexEntry":
        fail(f"{path}: Pokédex text pointer does not match {asm_name}")
    pages = [[]]
    for line in text_blocks[asm_name].splitlines():
        match = re.match(r'^\s*(text|next|page) "([^"]*)"\s*$', line)
        if match:
            directive, value = match.groups()
            if directive == "page":
                pages.append([])
            pages[-1].append(value)
        elif re.match(r"^\s*dex\s*$", line):
            continue
        elif line.strip():
            fail(f"{path}: unsupported Pokédex text line: {line}")
    if len(pages) != 2 or any(len(page) != 3 for page in pages):
        fail(f"{path}: Pokédex text must contain two pages of three lines")
    return {
        "category": category,
        "height": [int(height[0]), int(height[1])],
        "weight": int(weight),
        "description": pages,
    }


def parse_base_stats(path, declared_sprites, evo_blocks, entry_blocks, text_blocks):
    text = path.read_text()
    dex = one(r"^\s*db\s+(DEX_[A-Z0-9_]+)\s*;\s*pokedex id\s*$", text, "Pokédex ID", path)
    stats = one(
        r"^\s*db\s+([0-9]+(?:\s*,\s*[0-9]+){4})\s*$\n\s*;\s*hp\s+atk\s+def\s+spd\s+spc\s*$",
        text,
        "base stats",
        path,
    )
    stats = [int(value.strip()) for value in stats.split(",")]
    types = [value.strip() for value in one(r"^\s*db\s+([^;]+)\s*;\s*type\s*$", text, "types", path).split(",")]
    catch_rate = one(r"^\s*db\s+([A-Za-z0-9_]+)\s*;\s*catch rate\s*$", text, "catch rate", path)
    exp_yield = one(r"^\s*db\s+([A-Za-z0-9_]+)\s*;\s*base exp\s*$", text, "base EXP", path)
    front_pic = one(r'INCBIN "([^"]+\.pic)"\s*,\s*0\s*,\s*1\s*;\s*sprite dimensions', text, "front sprite", path)
    pointers = one(r"^\s*dw\s+([A-Za-z0-9_.]+PicFront),\s*([A-Za-z0-9_.]+PicBack)\s*$", text, "sprite pointers", path)
    level_1_moves = [value.strip() for value in one(r"^\s*db\s+([^;]+)\s*;\s*level 1 learnset\s*$", text, "level-1 moves", path).split(",")]
    growth_rate = one(r"^\s*db\s+([A-Za-z0-9_]+)\s*;\s*growth rate\s*$", text, "growth rate", path)
    tmhm_match = re.search(
        r"^\s*tmhm(?:[ \t]+(?P<first>.*))?\n(?P<body>.*?)^\s*;\s*end\s*$",
        text,
        re.MULTILINE | re.DOTALL,
    )
    if not tmhm_match:
        fail(f"{path}: expected tmhm declaration")
    tmhm_text = ((tmhm_match.group("first") or "") + " " + tmhm_match.group("body")).replace("\\", "")
    tmhm = [value for value in re.split(r"[\s,]+", tmhm_text) if value]
    if pointers[0] not in declared_sprites or pointers[1] not in declared_sprites:
        fail(f"{path}: sprite pointer is not declared in the sprite data")
    if declared_sprites[pointers[0]] != front_pic:
        fail(f"{path}: front sprite include does not match {pointers[0]} declaration")
    back_pic = declared_sprites[pointers[1]]
    front_png = front_pic[:-4] + ".png"
    back_png = back_pic[:-4] + ".png"
    if not (ROOT / front_png).is_file():
        fail(f"{path}: sprite source does not exist: {front_png}")
    if not (ROOT / back_png).is_file():
        fail(f"{path}: sprite source does not exist: {back_png}")
    front_label, back_label = pointers
    asm_name = front_label.removesuffix("PicFront")
    if back_label != asm_name + "PicBack":
        fail(f"{path}: front/back sprite labels do not share asm_name")
    if dex.removeprefix("DEX_") == "":
        fail(f"{path}: empty species ID")
    if asm_name not in evo_blocks:
        fail(f"{path}: missing evolution/learnset record for {asm_name}")
    evolution_text, learnset_text = evo_blocks[asm_name].split("; Learnset", 1)
    evolutions = []
    for line in evolution_text.splitlines():
        values = [value.strip() for value in line.split(",")]
        if not values or not values[0].startswith("db EVOLVE_"):
            continue
        method = values[0][3:]
        if method == "EVOLVE_LEVEL":
            if len(values) != 3:
                fail(f"{path}: malformed level evolution")
            evolutions.append({"method": method, "level": int(values[1]), "species": values[2]})
        elif method == "EVOLVE_ITEM":
            if len(values) != 4:
                fail(f"{path}: malformed item evolution")
            evolutions.append({"method": method, "item": values[1], "level": int(values[2]), "species": values[3]})
        elif method == "EVOLVE_TRADE":
            if len(values) != 3:
                fail(f"{path}: malformed trade evolution")
            evolutions.append({"method": method, "level": int(values[1]), "species": values[2]})
        else:
            fail(f"{path}: unsupported evolution method {method}")
    learnset = []
    for line in learnset_text.splitlines():
        match = re.match(r"^\s*db\s+(\d+)\s*,\s*([A-Za-z0-9_]+)\s*$", line)
        if match:
            learnset.append({"level": int(match.group(1)), "move": match.group(2)})
    return {
        "id": dex.removeprefix("DEX_"),
        "asm_name": asm_name,
        "sprites": {"front": front_png, "back": back_png},
        "stats": dict(zip(STAT_FIELDS, stats)),
        "types": types,
        "catch_rate": catch_rate,
        "exp_yield": exp_yield,
        "level_1_moves": level_1_moves,
        "growth_rate": growth_rate,
        "tmhm": tmhm,
        "evolutions": evolutions,
        "learnset": learnset,
        "pokedex": parse_pokedex(asm_name, entry_blocks, text_blocks, path),
    }


def load_records():
    paths = sorted(BASE_STATS.glob("*.gen.asm"))
    if len(paths) != EXPECTED_COUNT:
        fail(f"expected {EXPECTED_COUNT} base-stat files, found {len(paths)}")
    declared_sprites = sprite_paths()
    evo_blocks = evo_move_blocks()
    entry_blocks = dex_entry_blocks()
    text_blocks = dex_text_blocks()
    records = []
    for path in paths:
        records.append((path.name.removesuffix(".gen.asm"), parse_base_stats(path, declared_sprites, evo_blocks, entry_blocks, text_blocks)))
    return records


def validate_record(filename, record, seen_ids, seen_asm):
    prefix = f"{SPECIES / filename}:"
    if set(record) != ALLOWED_FIELDS:
        fail(f"{prefix} fields must be exactly {sorted(ALLOWED_FIELDS)}")
    for field in REQUIRED_FIELDS:
        if field not in record:
            fail(f"{prefix} missing required field {field}")
    species_id = record["id"]
    asm_name = record["asm_name"]
    if not isinstance(species_id, str) or not species_id:
        fail(f"{prefix} id must be a non-empty string")
    if species_id in seen_ids:
        fail(f"{prefix} duplicate species id {species_id}")
    seen_ids.add(species_id)
    if not isinstance(asm_name, str) or not asm_name:
        fail(f"{prefix} asm_name must be a non-empty string")
    if asm_name in seen_asm:
        fail(f"{prefix} duplicate asm_name {asm_name}")
    seen_asm.add(asm_name)
    sprites = record["sprites"]
    if not isinstance(sprites, dict) or set(sprites) != {"front", "back"}:
        fail(f"{prefix} sprites must contain exactly front and back")
    for side in ("front", "back"):
        value = sprites[side]
        if not isinstance(value, str) or not value or value.startswith("/") or ".." in Path(value).parts:
            fail(f"{prefix} sprites.{side} must be a repository-relative path")
        if not (ROOT / value).is_file() or not value.endswith(".png"):
            fail(f"{prefix} missing PNG sprite: {value}")
    stats = record["stats"]
    if not isinstance(stats, dict) or set(stats) != set(STAT_FIELDS):
        fail(f"{prefix} stats must contain exactly {STAT_FIELDS}")
    for field in STAT_FIELDS:
        value = stats[field]
        if type(value) is not int or not 0 <= value <= 255:
            fail(f"{prefix} stats.{field} must be an integer from 0 to 255")
    if not isinstance(record["types"], list) or len(record["types"]) != 2 or any(not isinstance(value, str) or not value for value in record["types"]):
        fail(f"{prefix} types must contain exactly two non-empty symbols")
    for field in ("catch_rate", "exp_yield", "growth_rate"):
        if not isinstance(record[field], str) or not record[field]:
            fail(f"{prefix} {field} must be a non-empty symbol")
    moves = record["level_1_moves"]
    if not isinstance(moves, list) or len(moves) != 4 or any(not isinstance(value, str) or not value for value in moves):
        fail(f"{prefix} level_1_moves must contain exactly four symbols")
    tmhm = record["tmhm"]
    if not isinstance(tmhm, list) or any(not isinstance(value, str) or not value for value in tmhm):
        fail(f"{prefix} tmhm must be an array of symbols")
    if len(tmhm) != len(set(tmhm)):
        fail(f"{prefix} tmhm contains duplicate entries")
    evolutions = record["evolutions"]
    if not isinstance(evolutions, list):
        fail(f"{prefix} evolutions must be an array")
    for evolution in evolutions:
        if not isinstance(evolution, dict) or evolution.get("method") not in {"EVOLVE_LEVEL", "EVOLVE_ITEM", "EVOLVE_TRADE"}:
            fail(f"{prefix} invalid evolution")
        if set(evolution) not in ({"method", "level", "species"}, {"method", "item", "level", "species"}):
            fail(f"{prefix} invalid evolution fields")
        if evolution["method"] == "EVOLVE_ITEM" and "item" not in evolution:
            fail(f"{prefix} item evolution is missing item")
        if evolution["method"] != "EVOLVE_ITEM" and "item" in evolution:
            fail(f"{prefix} non-item evolution has item")
        if type(evolution["level"]) is not int or not 1 <= evolution["level"] <= 100:
            fail(f"{prefix} evolution level must be an integer from 1 to 100")
        if not isinstance(evolution["species"], str) or not evolution["species"]:
            fail(f"{prefix} evolution species must be a non-empty symbol")
    learnset = record["learnset"]
    if not isinstance(learnset, list) or any(not isinstance(entry, dict) or set(entry) != {"level", "move"} for entry in learnset):
        fail(f"{prefix} learnset must contain level/move objects")
    if any(type(entry["level"]) is not int or not 1 <= entry["level"] <= 100 or not isinstance(entry["move"], str) or not entry["move"] for entry in learnset):
        fail(f"{prefix} learnset entries are invalid")
    pokedex = record["pokedex"]
    if not isinstance(pokedex, dict) or set(pokedex) != {"category", "height", "weight", "description"}:
        fail(f"{prefix} pokedex fields are invalid")
    if not isinstance(pokedex["category"], str) or not pokedex["category"]:
        fail(f"{prefix} pokedex category must be a non-empty string")
    if not isinstance(pokedex["height"], list) or len(pokedex["height"]) != 2 or any(type(value) is not int or value < 0 for value in pokedex["height"]):
        fail(f"{prefix} pokedex height must contain two non-negative integers")
    if type(pokedex["weight"]) is not int or pokedex["weight"] < 0:
        fail(f"{prefix} pokedex weight must be a non-negative integer")
    description = pokedex["description"]
    if not isinstance(description, list) or len(description) != 2 or any(not isinstance(page, list) or len(page) != 3 or any(not isinstance(line, str) or not line for line in page) for page in description):
        fail(f"{prefix} pokedex description must contain two pages of three non-empty lines")


def load_json_records():
    paths = sorted(SPECIES.glob("*.json"))
    if len(paths) != EXPECTED_COUNT:
        fail(f"expected {EXPECTED_COUNT} species JSON files, found {len(paths)}")
    records = []
    seen_ids = set()
    seen_asm = set()
    for path in paths:
        try:
            record = json.loads(path.read_text())
        except (OSError, json.JSONDecodeError) as error:
            fail(f"{path}: invalid JSON: {error}")
        if not isinstance(record, dict):
            fail(f"{path}: top-level JSON value must be an object")
        validate_record(path.name, record, seen_ids, seen_asm)
        records.append((path.stem, record))
    return records


def extract():
    records = load_records()
    SPECIES.mkdir(parents=True, exist_ok=True)
    for filename, record in records:
        (SPECIES / f"{filename}.json").write_text(json.dumps(record, indent=2) + "\n")
    print(f"extracted {len(records)} species records")


def asm_line_moves(moves):
    lines = []
    current = "tmhm"
    for move in moves:
        candidate = f"{current} {move}," if current == "tmhm" else f"{current} {move},"
        if len(candidate) > 78 and current != "tmhm":
            lines.append(current + " \\")
            current = "     " + move + ","
        else:
            current = candidate
    lines.append(current.rstrip(","))
    return lines


def generate_evos_moves(record):
    lines = [
        f"{record['asm_name']}EvosMoves:",
        "; Evolutions",
    ]
    for evolution in record["evolutions"]:
        method = evolution["method"]
        if method == "EVOLVE_LEVEL":
            values = [method, str(evolution["level"]), evolution["species"]]
        elif method == "EVOLVE_ITEM":
            values = [method, evolution["item"], str(evolution["level"]), evolution["species"]]
        else:
            values = [method, str(evolution["level"]), evolution["species"]]
        lines.append("\tdb " + ", ".join(values))
    lines.extend(["\tdb 0", "; Learnset"])
    lines.extend(f"\tdb {entry['level']}, {entry['move']}" for entry in record["learnset"])
    lines.append("\tdb 0")
    return "\n".join(lines) + "\n"


def generate_dex_entry(record):
    pokedex = record["pokedex"]
    return "\n".join([
        f"{record['asm_name']}DexEntry:",
        f'\tdb "{pokedex["category"]}@"',
        f"\tdb {pokedex['height'][0]},{pokedex['height'][1]}",
        f"\tdw {pokedex['weight']}",
        f"\ttext_far _{record['asm_name']}DexEntry",
        "\ttext_end",
        "",
    ])


def generate_dex_text(record):
    pages = record["pokedex"]["description"]
    lines = [f"_{record['asm_name']}DexEntry::"]
    lines.extend([f'\ttext "{pages[0][0]}"', *(f'\tnext "{line}"' for line in pages[0][1:])])
    lines.append(f'\tpage "{pages[1][0]}"')
    lines.extend(f'\tnext "{line}"' for line in pages[1][1:])
    lines.extend(["\tdex", ""])
    return "\n".join(lines)


def generate(filename, record):
    asm = [
        f"\tdb DEX_{record['id']} ; pokedex id",
        "",
        "\tdb " + ", ".join(str(record["stats"][field]) for field in STAT_FIELDS),
        "\t;   hp  atk  def  spd  spc",
        "",
        f"\tdb {record['types'][0]}, {record['types'][1]} ; type",
        f"\tdb {record['catch_rate']} ; catch rate",
        f"\tdb {record['exp_yield']} ; base exp",
        "",
        f"\tINCBIN \"{record['sprites']['front'][:-4]}.pic\", 0, 1 ; sprite dimensions",
        f"\tdw {record['asm_name']}PicFront, {record['asm_name']}PicBack",
        "",
        f"\tdb {', '.join(record['level_1_moves'])} ; level 1 learnset",
        f"\tdb {record['growth_rate']} ; growth rate",
        "",
        "\t; tm/hm learnset",
    ]
    asm.extend("\t" + line if line.startswith("tmhm") else "\t" + line for line in asm_line_moves(record["tmhm"]))
    asm.extend([
        "\t; end",
        "",
        f"\tdb BANK({record['asm_name']}PicFront)",
        f"\tassert BANK({record['asm_name']}PicFront) == BANK({record['asm_name']}PicBack)",
        "",
    ])
    return "\n".join(asm)


def generate_all():
    records = load_json_records()
    BASE_STATS.mkdir(parents=True, exist_ok=True)
    EVOS_MOVES.mkdir(parents=True, exist_ok=True)
    DEX_ENTRIES.mkdir(parents=True, exist_ok=True)
    DEX_TEXT.mkdir(parents=True, exist_ok=True)
    for filename, record in records:
        (BASE_STATS / f"{filename}.gen.asm").write_text(generate(filename, record))
        (EVOS_MOVES / f"{filename}.gen.asm").write_text(generate_evos_moves(record))
        (DEX_ENTRIES / f"{filename}.gen.asm").write_text(generate_dex_entry(record))
        (DEX_TEXT / f"{filename}.gen.asm").write_text(generate_dex_text(record))
    print(f"generated {len(records)} species records")


def generate_one(filename):
    records = dict(load_json_records())
    if filename not in records:
        fail(f"no species JSON record for {filename}")
    record = records[filename]
    BASE_STATS.mkdir(parents=True, exist_ok=True)
    EVOS_MOVES.mkdir(parents=True, exist_ok=True)
    DEX_ENTRIES.mkdir(parents=True, exist_ok=True)
    DEX_TEXT.mkdir(parents=True, exist_ok=True)
    (BASE_STATS / f"{filename}.gen.asm").write_text(generate(filename, record))
    (EVOS_MOVES / f"{filename}.gen.asm").write_text(generate_evos_moves(record))
    (DEX_ENTRIES / f"{filename}.gen.asm").write_text(generate_dex_entry(record))
    (DEX_TEXT / f"{filename}.gen.asm").write_text(generate_dex_text(record))
    print(f"generated {filename}")


def validate():
    records = load_json_records()
    expected_files = {stem for stem, _ in load_records()}
    actual_files = {stem for stem, _ in records}
    if expected_files != actual_files:
        fail(f"species JSON filenames do not match base-stat files: missing {sorted(expected_files - actual_files)}, extra {sorted(actual_files - expected_files)}")
    print(f"validated {len(records)} species records")


def main(argv):
    if len(argv) not in {2, 3} or argv[1] not in {"extract", "generate", "generate-one", "validate"} or (argv[1] == "generate-one" and len(argv) != 3) or (argv[1] != "generate-one" and len(argv) != 2):
        print(f"usage: {argv[0]} extract|generate|generate-one NAME|validate", file=sys.stderr)
        return 2
    try:
        if argv[1] == "generate-one":
            generate_one(argv[2])
        else:
            {"extract": extract, "generate": generate_all, "validate": validate}[argv[1]]()
    except (OSError, ValueError) as error:
        print(f"error: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
