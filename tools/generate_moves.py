#!/usr/bin/env python3
"""Generate move-related RGBDS assembly from the canonical move CSV."""

import csv
import re
import sys
from pathlib import Path


FIELDS = (
    "id", "constant", "name", "animation", "animation_routine", "effect",
    "power", "type", "accuracy", "pp", "high_crit", "sfx",
    "sfx_pitch_mod", "sfx_tempo_mod", "description_1", "description_2",
)
MODES = {"constants", "moves", "names", "descriptions", "sfx", "animation-pointers", "critical-hits"}
MAX_MOVE_ID = 165
DESCRIPTION_LABELS = {
    "DRAGONBREATH": "DragonBreath",
    "SOLARBEAM": "SolarBeam",
    "THUNDERPUNCH": "ThunderPunch",
}


def fail(message):
    raise ValueError(message)


def integer(value, row, field):
    try:
        return int(value, 0) if not value.startswith("$") else int(value[1:], 16)
    except ValueError:
        fail(f"row {row}: {field} must be an integer, got {value!r}")


def validate(rows):
    if not rows:
        fail("CSV contains no moves")
    for field in FIELDS:
        if field not in rows[0]:
            fail(f"missing required column {field!r}")
    ids = set()
    constants = set()
    for row_number, move in enumerate(rows, 2):
        for field in FIELDS:
            if move[field] == "" and field not in ("description_1", "description_2"):
                fail(f"row {row_number}: {field} must not be empty")
        move_id = integer(move["id"], row_number, "id")
        if move_id in ids:
            fail(f"row {row_number}: duplicate move ID {move_id}")
        ids.add(move_id)
        if move["constant"] in constants:
            fail(f"row {row_number}: duplicate move constant {move['constant']}")
        constants.add(move["constant"])
        if move_id != row_number - 1:
            fail(f"row {row_number}: IDs must be stored in ascending order")
        if not re.fullmatch(r"[A-Z][A-Z0-9_]*", move["constant"]):
            fail(f"row {row_number}: invalid move constant {move['constant']!r}")
        for field in ("animation", "power", "accuracy", "pp"):
            value = integer(move[field], row_number, field)
            if field == "power" and not 0 <= value <= 255:
                fail(f"row {row_number}: power must fit in one byte")
            if field == "accuracy" and not 0 <= value <= 100:
                fail(f"row {row_number}: accuracy must be between 0 and 100")
            if field == "pp" and not 0 <= value <= 40:
                fail(f"row {row_number}: PP must be between 0 and 40")
            if field == "animation" and not 0 <= value <= 255:
                fail(f"row {row_number}: animation must fit in one byte")
        if move["high_crit"] not in ("true", "false"):
            fail(f"row {row_number}: high_crit must be true or false")
        for field in ("sfx_pitch_mod", "sfx_tempo_mod"):
            value = integer(move[field], row_number, field)
            if not 0 <= value <= 255:
                fail(f"row {row_number}: {field} must fit in one byte")
        for field in ("name", "description_1", "description_2"):
            if "@" in move[field]:
                fail(f"row {row_number}: {field} contains the ASM string terminator @")
    expected = list(range(1, MAX_MOVE_ID + 1))
    actual = [integer(move["id"], index + 2, "id") for index, move in enumerate(rows)]
    if actual != expected:
        fail(f"IDs must be contiguous from 1 through {MAX_MOVE_ID}")


def load(path):
    with path.open(newline="") as source:
        reader = csv.DictReader(source)
        if reader.fieldnames is None:
            fail("CSV has no header")
        if set(reader.fieldnames) != set(FIELDS):
            missing = sorted(set(FIELDS) - set(reader.fieldnames))
            extra = sorted(set(reader.fieldnames) - set(FIELDS))
            fail(f"CSV columns differ; missing={missing}, extra={extra}")
        rows = list(reader)
    validate(rows)
    return rows


def label(move):
    return DESCRIPTION_LABELS.get(
        move["constant"], "".join(part.title() for part in move["constant"].split("_"))
    )


def generate(mode, rows):
    output = []
    if mode == "constants":
        output += ["; Generated from data/moves/moves.csv.", "\tconst_def", "\tconst NO_MOVE"]
        output += [f"\tconst {move['constant']} ; {move['id']}" for move in rows]
        output.append("DEF NUM_ATTACKS EQU const_value - 1")
    elif mode == "moves":
        output += ["Moves:", "\t table_width MOVE_LENGTH, Moves"]
        output += [
            f"\tdb {move['animation']}, {move['effect']}, {move['power']}, {move['type']}, "
            f"{move['accuracy']} percent, {move['pp']}"
            for move in rows
        ]
        output.append("\tassert_table_length NUM_ATTACKS")
    elif mode == "names":
        output += ["MoveNames::", "\tlist_start MoveNames"]
        output += [f"\tli \"{move['name']}\"" for move in rows]
        output.append("\tassert_list_length NUM_ATTACKS")
    elif mode == "descriptions":
        output += ["MoveDescriptions:", "\t table_width 2, MoveDescriptions"]
        output += [f"\tdw {label(move)}Description" for move in rows]
        output += ["\tassert_table_length NUM_ATTACKS", ""]
        for move in rows:
            output += [
                f"{label(move)}Description:",
                f"\tdb \"{move['description_1']}\"",
                f"\tfeed \"{move['description_2']}@\"",
                "",
            ]
    elif mode == "sfx":
        output += ["MoveSoundTable:", "\t table_width 3, MoveSoundTable"]
        output += [
            f"\tdb {move['sfx']}, {move['sfx_pitch_mod']}, {move['sfx_tempo_mod']}"
            for move in rows
        ]
        output += ["\tassert_table_length NUM_ATTACKS", "\tdb SFX_BATTLE_0B, $00, $80"]
    elif mode == "animation-pointers":
        output += [f"\tdw {move['animation_routine']}" for move in rows]
    elif mode == "critical-hits":
        output += [f"\tdb {move['constant']}" for move in rows if move["high_crit"] == "true"]
        output.append("\tdb -1 ; end")
    return "\n".join(output) + "\n"


def main(argv):
    if len(argv) != 3 or argv[1] not in MODES:
        print(f"usage: {argv[0]} MODE moves.csv", file=sys.stderr)
        print(f"modes: {', '.join(sorted(MODES))}", file=sys.stderr)
        return 2
    try:
        sys.stdout.write(generate(argv[1], load(Path(argv[2]))))
    except (OSError, ValueError) as error:
        print(f"{argv[0]}: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
