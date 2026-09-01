#!/usr/bin/env python3
"""Generate item-related RGBDS assembly from the canonical item CSVs."""

import csv
import re
import sys
from pathlib import Path

ITEM_FIELDS = (
    "id", "kind", "symbol", "name", "legacy_symbol", "aliases", "price",
    "key_item", "description_group", "description_label", "description_text",
    "use_handler", "party_menu", "close_menu", "vending_price", "guard_drink",
    "bag_sort_order",
)
MACHINE_FIELDS = ("item_id", "kind", "number", "move", "name", "price")
MODES = {"constants", "names", "prices", "key-items", "use", "party", "close",
          "guard", "vending", "descriptions", "tm-prices", "sort-order"}
ITEM_MAX = 0x61
ORDINARY_MAX = 0x53


def fail(message):
    raise ValueError(message)


def integer(value, row, field):
    try:
        return int(value, 0) if not value.startswith("$") else int(value[1:], 16)
    except ValueError:
        fail(f"row {row}: {field} must be an integer, got {value!r}")


def load_csv(path, fields):
    with path.open(newline="") as source:
        reader = csv.DictReader(source)
        if reader.fieldnames is None:
            fail(f"{path}: CSV has no header")
        if tuple(reader.fieldnames) != fields:
            fail(f"{path}: columns differ; expected {fields}, got {reader.fieldnames}")
        return list(reader)


def boolean(value, row, field):
    if value not in ("true", "false"):
        fail(f"row {row}: {field} must be true or false")
    return value == "true"


def load_items(path):
    rows = load_csv(path, ITEM_FIELDS)
    if not rows:
        fail("items CSV contains no rows")
    for item in rows:
        item["bag_sort_order"] = item["bag_sort_order"] or ""
    ids = set()
    symbols = set()
    for row_number, item in enumerate(rows, 2):
        for field in ITEM_FIELDS:
            if item[field] == "" and field in ("id", "kind", "symbol", "name", "price", "key_item", "description_group", "description_label", "description_text"):
                if field not in ("name", "description_text") or item["symbol"] != "NO_ITEM":
                    fail(f"row {row_number}: {field} must not be empty")
        item_id = integer(item["id"], row_number, "id")
        if item_id in ids:
            fail(f"row {row_number}: duplicate item ID {item_id:#x}")
        if item["symbol"] in symbols:
            fail(f"row {row_number}: duplicate item symbol {item['symbol']}")
        ids.add(item_id)
        symbols.add(item["symbol"])
        if item["kind"] not in ("item", "floor"):
            fail(f"row {row_number}: kind must be item or floor")
        integer(item["price"], row_number, "price")
        if not 0 <= integer(item["price"], row_number, "price") <= 999999:
            fail(f"row {row_number}: price must fit bcd3")
        for field in ("key_item", "party_menu", "close_menu", "guard_drink"):
            boolean(item[field], row_number, field)
        if item["bag_sort_order"]:
            integer(item["bag_sort_order"], row_number, "bag_sort_order")
        integer(item["description_group"], row_number, "description_group")
        if "@" in item["name"] or "@" in item["description_text"]:
            fail(f"row {row_number}: text contains the ASM string terminator @")
    actual = sorted(ids)
    if actual != list(range(ITEM_MAX + 1)):
        fail("item IDs must be contiguous from 0x00 through 0x61")
    if integer(rows[0]["id"], 2, "id") != 0 or rows[0]["symbol"] != "NO_ITEM":
        fail("NO_ITEM must be row 0x00")
    for item in rows:
        item_id = integer(item["id"], 0, "id")
        expected_kind = "floor" if item_id > ORDINARY_MAX else "item"
        if item["kind"] != expected_kind:
            fail(f"{item['symbol']}: expected kind {expected_kind}")
    labels = {}
    groups = {}
    for item in rows:
        group = integer(item["description_group"], 0, "description_group")
        label = item["description_label"]
        text = item["description_text"]
        if label in labels and labels[label] != group:
            fail(f"description label {label} belongs to multiple groups")
        labels[label] = group
        if group in groups and groups[group][1] != text:
            names = ", ".join(groups[group][0] + [item["symbol"]])
            fail(f"description group {group} has conflicting text among {names}")
        groups.setdefault(group, ([], text))[0].append(item["symbol"])
    return sorted(rows, key=lambda item: integer(item["id"], 0, "id"))


def load_machines(path, items, moves_path):
    rows = load_csv(path, MACHINE_FIELDS)
    moves = {row["constant"] for row in load_csv(moves_path, ("id", "constant", "name", "animation", "animation_routine", "effect", "power", "type", "accuracy", "pp", "high_crit", "sfx", "sfx_pitch_mod", "sfx_tempo_mod", "description_1", "description_2"))}
    ids = set()
    pairs = set()
    hms = [row for row in rows if row["kind"] == "HM"]
    tms = [row for row in rows if row["kind"] == "TM"]
    for row_number, machine in enumerate(rows, 2):
        if machine["kind"] not in ("HM", "TM"):
            fail(f"row {row_number}: kind must be HM or TM")
        item_id = integer(machine["item_id"], row_number, "item_id")
        number = integer(machine["number"], row_number, "number")
        price = integer(machine["price"], row_number, "price")
        if item_id in ids:
            fail(f"row {row_number}: duplicate machine item ID")
        if (machine["kind"], number) in pairs:
            fail(f"row {row_number}: duplicate machine kind and number")
        if machine["move"] not in moves:
            fail(f"row {row_number}: unknown move {machine['move']}")
        if not machine["name"]:
            fail(f"row {row_number}: machine name must not be empty")
        if machine["kind"] == "TM" and (price % 1000 or not 0 <= price // 1000 <= 15):
            fail(f"row {row_number}: TM price must encode in one nybble")
        ids.add(item_id)
        pairs.add((machine["kind"], number))
    if [integer(row["number"], 0, "number") for row in hms] != list(range(1, len(hms) + 1)):
        fail("HM numbers must be contiguous")
    if [integer(row["number"], 0, "number") for row in tms] != list(range(1, len(tms) + 1)):
        fail("TM numbers must be contiguous")
    if len(hms) != 5 or len(tms) != 51:
        fail("machine counts must remain 5 HMs and 51 TMs")
    return rows


def asm_string(value):
    return value.replace('\\"', '"').replace('"', '\\"')


def move_label(move):
    special = {"DRAGONBREATH": "DragonBreath", "SOLARBEAM": "SolarBeam", "THUNDERPUNCH": "ThunderPunch"}
    return special.get(move, "".join(part.title() for part in move.split("_"))) + "Description"


def generate(mode, items, machines):
    ordinary = [row for row in items if row["kind"] == "item" and integer(row["id"], 0, "id")]
    floors = [row for row in items if row["kind"] == "floor"]
    hms = [row for row in machines if row["kind"] == "HM"]
    tms = [row for row in machines if row["kind"] == "TM"]
    out = []
    if mode == "constants":
        out += ["; Generated from data/items/items.csv and data/items/machines.csv.", "\tconst_def"]
        for row in items[:ORDINARY_MAX + 1]:
            out.append(f"\tconst {row['symbol']} ; {row['id']}")
        out.append("DEF NUM_ITEMS EQU const_value - 1")
        for row in items[ORDINARY_MAX + 1:]:
            out.append(f"\tconst {row['symbol']} ; {row['id']}")
        for row in items[:ORDINARY_MAX + 1]:
            for alias in filter(None, row["aliases"].split(",")):
                out.append(f"DEF {alias.strip()} EQU {row['symbol']} ; overload")
        out += ["DEF NUM_FLOORS EQU const_value - 1 - NUM_ITEMS", "", f"DEF NUM_TMS EQU {len(tms)}", "DEF __tmhm_value__ = NUM_TMS + 1", ""]
        out.append("DEF HM01 EQU const_value")
        for number, machine in enumerate(hms, 1):
            move = machine["move"]
            out += [f"\tconst HM_{move}", f"\tDEF HM_VALUE = __tmhm_value__ - NUM_TMS"]
            if number > 1:
                out.append(f"\tDEF HM_{number:02d} EQU const_value - 1")
            else:
                out.append("\tDEF HM_01 EQU const_value - 1")
            out += [f"\tDEF HM{number:02d}_MOVE EQU {move}", f"\tDEF {move}_TMNUM EQU __tmhm_value__", "\tDEF __tmhm_value__ += 1"]
        out += ["DEF NUM_HMS EQU const_value - HM01", "", "DEF __tmhm_value__ = 1", "DEF TM01 EQU const_value"]
        for number, machine in enumerate(tms, 1):
            move = machine["move"]
            out += [f"\tconst TM_{move}"]
            if number > 1:
                out.append(f"\tDEF TM_{number:02d} EQU const_value - 1")
            else:
                out.append("\tDEF TM_01 EQU const_value - 1")
            out += [f"\tDEF TM{number:02d}_MOVE EQU {move}", f"\tDEF {move}_TMNUM EQU __tmhm_value__", "\tDEF __tmhm_value__ += 1"]
        out += [f"ASSERT NUM_TMS == const_value - TM01, \"NUM_TMS ({{d:NUM_TMS}}) does not match the number of add_tm definitions\"", "", "DEF NUM_TM_HM EQU NUM_TMS + NUM_HMS", "DEF __tmhm_value__ = NUM_TM_HM + 1", "DEF UNUSED_TMNUM EQU __tmhm_value__", "DEF MAX_HIDDEN_ITEMS EQU 112", "DEF MAX_HIDDEN_COINS EQU 16"]
    elif mode == "names":
        out += ["ItemNames::", "\tlist_start ItemNames"]
        out += [f"\tli \"{asm_string(row['name'])}\"" for row in ordinary]
        out += ["\tassert_list_length NUM_ITEMS"]
        out += [f"\tli \"{asm_string(row['name'])}\"" for row in floors]
        out += ["\tassert_list_length NUM_ITEMS + NUM_FLOORS"]
        out += [f"\tli \"{asm_string(row['name'])}\"" for row in hms]
        out += ["\tassert_list_length NUM_ITEMS + NUM_FLOORS + NUM_HMS"]
        out += [f"\tli \"{asm_string(row['name'])}\"" for row in tms]
        out += ["\tassert_list_length NUM_ITEMS + NUM_FLOORS + NUM_HMS + NUM_TMS"]
    elif mode == "prices":
        out += ["ItemPrices::", "\ttable_width 3, ItemPrices"]
        out += [f"\tbcd3 {row['price']}" for row in ordinary]
        out += ["\tassert_table_length NUM_ITEMS"]
        out += [f"\tbcd3 {row['price']}" for row in floors]
        out += ["\tassert_table_length NUM_ITEMS + NUM_FLOORS"]
    elif mode == "key-items":
        out += ["KeyItemFlags:", "\tbit_array KeyItemFlags"]
        out += [f"\tdbit {row['key_item'].upper()}" for row in ordinary]
        out += ["\tend_bit_array NUM_ITEMS"]
    elif mode == "use":
        out += [f"\tdw {row['use_handler']}" for row in ordinary]
    elif mode == "party":
        out += ["UsableItems_PartyMenu:"] + [f"\tdb {row['symbol']}" for row in ordinary if row["party_menu"] == "true"] + ["\tdb -1 ; end"]
    elif mode == "close":
        out += ["UsableItems_CloseMenu:"] + [f"\tdb {row['symbol']}" for row in ordinary if row["close_menu"] == "true"] + ["\tdb -1 ; end"]
    elif mode == "guard":
        out += ["GuardDrinksList:"] + [f"\tdb {row['symbol']}" for row in ordinary if row["guard_drink"] == "true"] + ["\tdb 0 ; end"]
    elif mode == "vending":
        out += ["MACRO vend_item", "\tdb \\1", "\tbcd3 \\2", "ENDM", "", "VendingPrices:", "\t; item id, price"]
        out += [f"\tvend_item {row['symbol']}, {row['vending_price']}" for row in ordinary if row["vending_price"]]
    elif mode == "descriptions":
        out += ["ItemDescriptions:", "\ttable_width 2"]
        out += [f"\tdw {row['description_label']}" for row in items[1:]]
        out += [f"\tdw {move_label(row['move'])}" for row in hms + tms]
        out += ["\tassert_table_length NUM_ITEMS + NUM_FLOORS + NUM_TM_HM", ""]
        out.append("")
        groups = {}
        for row in items:
            group = integer(row["description_group"], 0, "description_group")
            labels = groups.setdefault(group, [])
            if row["description_label"] not in [label for label, _ in labels]:
                labels.append((row["description_label"], row["description_text"]))
        for group in sorted(groups):
            labels = groups[group]
            for label, _ in labels:
                out.append(f"{label}:")
            first, *rest = labels[0][1].split("\\n")
            out.append(f"\tdb \"{asm_string(first)}\"")
            if rest:
                out.append(f"\tfeed \"{asm_string('\\n'.join(rest))}@\"")
            else:
                out.append("\tfeed \"@\"")
            out.append("")
    elif mode == "tm-prices":
        out += ["TechnicalMachinePrices:", "; In thousands (nybbles).", "\tnybble_array TechnicalMachinePrices"]
        out += [f"\tnybble {integer(row['price'], 0, 'price') // 1000}" for row in tms]
        out.append("\tend_nybble_array NUM_TMS")
    elif mode == "sort-order":
        sorted_items = sorted(
            (row for row in ordinary if row["bag_sort_order"]),
            key=lambda row: integer(row["bag_sort_order"], 0, "bag_sort_order"),
        )
        orders = [integer(row["bag_sort_order"], 0, "bag_sort_order") for row in sorted_items]
        if orders != list(range(1, len(orders) + 1)):
            fail("bag_sort_order values must be contiguous starting at 1")
        out += ["ItemSortList::"]
        out += [f"\tdb {row['symbol']}" for row in sorted_items]
        out += [f"\tdb HM_{int(row['number']):02d}" for row in hms]
        out += [f"\tdb TM_{int(row['number']):02d}" for row in tms]
        out.append("\tdb -1 ; end")
    return "\n".join(out) + "\n"


def main(argv):
    if len(argv) != 2 or argv[1] not in MODES:
        print(f"usage: {argv[0]} MODE", file=sys.stderr)
        return 2
    root = Path(__file__).parents[1]
    try:
        items = load_items(root / "data/items/items.csv")
        machines = load_machines(root / "data/items/machines.csv", items, root / "data/moves/moves.csv")
        sys.stdout.write(generate(argv[1], items, machines))
    except (OSError, ValueError) as error:
        print(f"{argv[0]}: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
