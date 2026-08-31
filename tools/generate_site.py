#!/usr/bin/env python3
"""Build disposable, dependency-free player documentation from canonical data."""

import csv
import html
import json
import os
import re
import shutil
import struct
import sys
import zlib
from pathlib import Path
from string import Template
from urllib.parse import quote

ROOT = Path(__file__).resolve().parents[1]
SPECIES_DIR = ROOT / "data/pokemon/species"
SITE_TEMPLATE = ROOT / "site/templates/base.html"
STAT_FIELDS = ("hp", "attack", "defense", "speed", "special")
PALETTE_FILE = ROOT / "data/sgb/sgb_palettes.asm"
README_FILE = ROOT / "README.md"


def fail(message):
    raise ValueError(message)


def slug(identifier):
    return re.sub(r"-+", "-", re.sub(r"[^a-z0-9]+", "-", identifier.lower())).strip("-")


def pretty(value):
    return value.removeprefix("EVOLVE_").replace("_", " ").title()


def gameplay_label(value):
    value = str(value)
    for prefix in ("EXP_YIELD_", "GROWTH_", "CR_"):
        if value.startswith(prefix):
            value = value.removeprefix(prefix)
            break
    return value.replace("_", "-").title()


def text(value):
    """Translate only the text markers used by the canonical data."""
    return str(value).replace("#MON", "Pokémon").replace("# BALL", "POKé BALL").replace("<TM>", "TM").replace("<HM>", "HM")


def esc(value):
    return html.escape(text(value), quote=True)


def paragraphs(value):
    lines = text(value).split(r"\n")
    return "".join(f"<p>{esc(line)}</p>" for line in lines if line)


def description(value):
    return "<br>".join(esc(line) for line in text(value).split(r"\n"))


def markdown_inline(value):
    value = html.escape(value, quote=True)
    value = re.sub(r"!\[([^]]*)\]\(([^)]+)\)", lambda match: f'<img src="{html.escape(match.group(2), quote=True)}" alt="{match.group(1)}">', value)
    value = re.sub(r"\[([^]]+)\]\(([^)]+)\)", lambda match: f'<a href="{html.escape(match.group(2), quote=True)}">{match.group(1)}</a>', value)
    return re.sub(r"`([^`]+)`", r"<code>\1</code>", value)


def markdown_html(source):
    lines = source.splitlines()
    if lines and lines[0].startswith("# "):
        lines = lines[1:]
    blocks, paragraph, index = [], [], 0

    def flush_paragraph():
        if paragraph:
            blocks.append(f'<p>{markdown_inline(" ".join(paragraph))}</p>')
            paragraph.clear()

    while index < len(lines):
        line = lines[index]
        heading = re.match(r"^(#{2,6})\s+(.+)$", line)
        if not line.strip():
            flush_paragraph()
        elif heading:
            flush_paragraph()
            level, title = len(heading.group(1)), markdown_inline(heading.group(2))
            blocks.append(f"<h{level}>{title}</h{level}>")
        elif line.startswith("* "):
            flush_paragraph()
            items = []
            while index < len(lines) and lines[index].startswith("* "):
                items.append(f"<li>{markdown_inline(lines[index][2:])}</li>")
                index += 1
            blocks.append("<ul>" + "".join(items) + "</ul>")
            continue
        else:
            paragraph.append(line)
        index += 1
    flush_paragraph()
    return "<article class=\"readme\">" + "".join(blocks) + "</article>"


def type_name(value):
    return value.removesuffix("_TYPE")


def move_effect(move):
    if move["high_crit"] == "true":
        return "CH"
    effects = {
        "POISON_EFFECT": "PSN", "POISON_SIDE_EFFECT1": "PSN", "POISON_SIDE_EFFECT2": "PSN",
        "SLEEP_EFFECT": "SLP", "CONFUSION_EFFECT": "CNF", "CONFUSION_SIDE_EFFECT": "CNF",
        "FREEZE_SIDE_EFFECT": "FRZ", "BURN_SIDE_EFFECT1": "BRN", "BURN_SIDE_EFFECT2": "BRN",
        "PARALYZE_EFFECT": "PAR", "PARALYZE_SIDE_EFFECT1": "PAR", "PARALYZE_SIDE_EFFECT2": "PAR",
        "ATTACK_UP1_EFFECT": "U1", "DEFENSE_UP1_EFFECT": "U1", "SPEED_UP1_EFFECT": "U1", "SPECIAL_UP1_EFFECT": "U1",
        "ATTACK_UP2_EFFECT": "U2", "DEFENSE_UP2_EFFECT": "U2", "SPEED_UP2_EFFECT": "U2", "SPECIAL_UP2_EFFECT": "U2",
        "ATTACK_DOWN1_EFFECT": "D1", "ATTACK_DOWN_SIDE_EFFECT": "D1", "DEFENSE_DOWN1_EFFECT": "D1", "DEFENSE_DOWN_SIDE_EFFECT": "D1",
        "SPEED_DOWN1_EFFECT": "D1", "SPEED_DOWN_SIDE_EFFECT": "D1", "SPECIAL_DOWN1_EFFECT": "D1", "SPECIAL_DOWN_SIDE_EFFECT": "D1",
        "ATTACK_DOWN2_EFFECT": "D2", "DEFENSE_DOWN2_EFFECT": "D2", "SPEED_DOWN2_EFFECT": "D2", "SPECIAL_DOWN2_EFFECT": "D2",
        "HEAL_EFFECT": "HEART", "DRAIN_HP_EFFECT": "HEART", "LEECH_SEED_EFFECT": "HEART",
        "RECOIL_EFFECT": "BOUNCE", "FLINCH_SIDE_EFFECT1": "PAIN", "FLINCH_SIDE_EFFECT2": "PAIN",
        "CHARGE_EFFECT": "CLOCK", "FLY_EFFECT": "CLOCK", "HYPER_BEAM_EFFECT": "CLOCK",
        "TRAPPING_EFFECT": "SPIRAL", "RAGE_EFFECT": "ANGRY", "THRASH_PETAL_DANCE_EFFECT": "ANGRY",
    }
    return effects.get(move["effect"], "" if move["effect"] in ("NO_ADDITIONAL_EFFECT", "SPLASH_EFFECT") else "SPARKLE")


def multi_hit_prefix(move):
    return {"ATTACK_TWICE_EFFECT": "+", "TWO_TO_FIVE_ATTACKS_EFFECT": "×", "TWINEEDLE_EFFECT": "+"}.get(move["effect"], "")


def effect_html(move):
    effect = move_effect(move)
    title = effect_title(move)
    return f'<span class="move-effect move-effect-{slug(effect)}" title="{esc(title)}"></span>' if effect else ""


def effect_title(move):
    return "HIGH CRIT" if move["high_crit"] == "true" else move["effect"].replace("_", " ")


def price(value):
    return "---" if str(value) == "0" else f"₽{esc(value)}"


def sell_price(value):
    return price(str(int(value) // 2))


def load_csv(path):
    with path.open(newline="", encoding="utf-8") as source:
        return list(csv.DictReader(source))


def load_palettes():
    palettes = {}
    pattern = re.compile(r"^\s*RGB\s+([^;]+);\s*(PAL_[A-Z0-9_]+)\s*$", re.MULTILINE)
    for values, name in pattern.findall(PALETTE_FILE.read_text(encoding="utf-8")):
        channels = [int(value) for value in re.findall(r"\d+", values)]
        if len(channels) != 12:
            fail(f"{PALETTE_FILE}: invalid palette {name}")
        palettes[name] = tuple(tuple(channels[index:index + 3]) for index in range(0, 12, 3))
    # The ROM palette table has a historical typo for Exeggutor's symbol.
    if "PAL_EXEGGCUTOR" in palettes and "PAL_EXEGGUTOR" not in palettes:
        palettes["PAL_EXEGGUTOR"] = palettes["PAL_EXEGGCUTOR"]
    if "PAL_WEEEZING" in palettes and "PAL_WEEZING" not in palettes:
        palettes["PAL_WEEZING"] = palettes["PAL_WEEEZING"]
    return palettes


def integer(value):
    return int(value, 0) if str(value).lower().startswith("0x") else int(value)


def load_model():
    pokemon = []
    for path in sorted(SPECIES_DIR.glob("*.json")):
        record = json.loads(path.read_text(encoding="utf-8"))
        record["_stem"] = path.stem
        record["_url"] = f"pokemon/{quote(path.stem)}/"
        pokemon.append(record)
    moves = load_csv(ROOT / "data/moves/moves.csv")
    moves_by_constant = {row["constant"]: row for row in moves}
    items = load_csv(ROOT / "data/items/items.csv")
    items_by_symbol = {row["symbol"]: row for row in items}
    machines = load_csv(ROOT / "data/items/machines.csv")
    machines_by_id = {integer(row["item_id"]): row for row in machines}
    machines_by_pair = {(row["kind"], integer(row["number"])): row for row in machines}
    machines_by_move = {row["move"]: row for row in machines}
    for row in moves:
        row["_url"] = f"moves/{slug(row['constant'])}/"
    for row in items:
        row["_url"] = f"items/{slug(row['symbol'])}/"
    for row in machines:
        row["_url"] = f"items/{row['kind'].lower()}{integer(row['number']):02d}/"
    return {"pokemon": pokemon, "moves": moves, "moves_by": moves_by_constant,
            "items": items, "items_by": items_by_symbol, "machines": machines,
            "machines_by_id": machines_by_id, "machines_by_pair": machines_by_pair,
            "machines_by_move": machines_by_move, "palettes": load_palettes()}


def validate(model):
    pokemon = model["pokemon"]
    ids, numbers, urls = set(), set(), set()
    for p in pokemon:
        if p["id"] in ids: fail(f"duplicate Pokémon ID: {p['id']}")
        if p["pokedex_number"] in numbers: fail(f"duplicate Pokédex number: {p['pokedex_number']}")
        ids.add(p["id"]); numbers.add(p["pokedex_number"])
        for url in (p["_url"],):
            if url in urls: fail(f"duplicate page URL: {url}")
            urls.add(url)
        for side, source in p["sprites"].items():
            if not (ROOT / source).is_file(): fail(f"{p['id']}: missing {side} sprite: {source}")
        if p["palette"] not in model["palettes"]: fail(f"{p['id']}: unknown palette {p['palette']}")
        for entry in p["learnset"]:
            if entry["move"] not in model["moves_by"]: fail(f"{p['id']}: unknown learnset move {entry['move']}")
        for move in p["tmhm"]:
            if move not in model["moves_by"]: fail(f"{p['id']}: unknown TM/HM move {move}")
        for evo in p["evolutions"]:
            if not any(target["id"] == evo["species"] for target in pokemon): fail(f"{p['id']}: unknown evolution target {evo['species']}")
            if evo["method"] == "EVOLVE_ITEM" and evo["item"] not in model["items_by"]: fail(f"{p['id']}: unknown evolution item {evo['item']}")
    for move in model["moves"]:
        url = move["_url"]
        if url in urls: fail(f"duplicate page URL: {url}")
        urls.add(url)
    for item in model["items"]:
        if item["kind"] == "item" and item["symbol"] != "NO_ITEM":
            if item["_url"] in urls: fail(f"duplicate page URL: {item['_url']}")
            urls.add(item["_url"])
    for machine in model["machines"]:
        if machine["move"] not in model["moves_by"]: fail(f"machine {machine['name']}: unknown move {machine['move']}")
        if machine["_url"] in urls: fail(f"duplicate page URL: {machine['_url']}")
        urls.add(machine["_url"])
    model["urls"] = urls | {"index.html", "pokemon/", "moves/", "items/"}
    return model


def indexes(model):
    level, compat, reverse, item_users = {}, {}, {}, {}
    by_id = {p["id"]: p for p in model["pokemon"]}
    for p in model["pokemon"]:
        for entry in p["learnset"]:
            level.setdefault(entry["move"], []).append({"pokemon": p, "level": entry["level"]})
        for move in p["tmhm"]:
            compat.setdefault(move, []).append(p)
        for evo in p["evolutions"]:
            reverse.setdefault(evo["species"], []).append({"pokemon": p, "evolution": evo})
            if evo["method"] == "EVOLVE_ITEM":
                item_users.setdefault(evo["item"], []).append({"source": p, "target": by_id[evo["species"]], "evolution": evo})
    model.update(level_learners_by_move=level, machine_learners_by_move=compat, evolves_from=reverse,
                 evolution_users_by_item=item_users)


def link(model, current, target, label):
    if target not in model["urls"]: fail(f"internal link target does not exist: {target}")
    return f'<a href="{html.escape(relative(current, target), quote=True)}">{label}</a>'


def relative(current, target):
    current_file = current if not current.endswith("/") else current + "index.html"
    href = os.path.relpath(target, Path(current_file).parent).replace("\\", "/")
    if target.endswith("/") and not href.endswith("/"):
        href += "/"
    return href


def render(model, current, title, content):
    rel = lambda target: relative(current, target)
    template = Template(SITE_TEMPLATE.read_text(encoding="utf-8"))
    return template.safe_substitute(TITLE=esc(title), HEADING=esc(title), CONTENT=content,
        CSS=rel("static/site.css"), JS=rel("static/site.js"), HOME=rel("index.html"),
        POKEMON=rel("pokemon/"), MOVES=rel("moves/"), ITEMS=rel("items/"),
        FAVICON=rel("static/favicon.png"))


def write_page(out, model, path, title, content):
    if not path:
        destination = out / "index.html"
    else:
        destination = out / path / "index.html" if path.endswith("/") else out / path
    destination.parent.mkdir(parents=True, exist_ok=True)
    destination.write_text(render(model, path + ("index.html" if path.endswith("/") else ""), title, content), encoding="utf-8")


def type_html(types):
    seen = set()
    unique = []
    for value in types:
        label = type_name(value)
        if label not in seen:
            seen.add(label)
            unique.append(label)
    return " ".join(f'<span class="type type-{slug(value)}">{esc(value)}</span>' for value in unique)


def move_link(model, current, move): return link(model, current, move["_url"], esc(move["name"]))
def pokemon_link(model, current, p): return link(model, current, p["_url"], esc(p["display_name"]))
def item_link(model, current, item): return link(model, current, item["_url"], esc(item["name"]))


def move_stats(move):
    return f"{type_html([move['type']])} {esc(move['power']) if move['power'] != '0' else 'Status'} / {esc(move['accuracy'])}% / {esc(move['pp'])} PP"


def png_chunk(kind, payload):
    return struct.pack(">I", len(payload)) + kind + payload + struct.pack(">I", zlib.crc32(kind + payload) & 0xffffffff)


def png_size(path):
    header = path.read_bytes()
    if header[:8] != b"\x89PNG\r\n\x1a\n" or header[12:16] != b"IHDR":
        fail(f"{path}: invalid PNG header")
    return struct.unpack(">II", header[16:24])


def apply_palette(source, destination, colors):
    raw = source.read_bytes()
    if raw[:8] != b"\x89PNG\r\n\x1a\n": fail(f"{source}: not a PNG")
    position, idat, width, height, color_type, bit_depth, png_palette, transparency = 8, bytearray(), None, None, None, None, [], []
    chunks = []
    while position < len(raw):
        length = struct.unpack(">I", raw[position:position + 4])[0]
        kind = raw[position + 4:position + 8]
        payload = raw[position + 8:position + 8 + length]
        position += 12 + length
        if kind == b"IHDR":
            width, height, bit_depth, color_type, compression, filtering, interlace = struct.unpack(">IIBBBBB", payload)
            if (compression, filtering, interlace) != (0, 0, 0) or (color_type not in (0, 2, 3, 6)) or bit_depth not in (2, 8):
                fail(f"{source}: unsupported PNG format")
        elif kind == b"IDAT": idat.extend(payload)
        elif kind == b"PLTE": png_palette = [tuple(payload[index:index + 3]) for index in range(0, len(payload), 3)]
        elif kind == b"tRNS": transparency = list(payload)
        elif kind == b"IEND": break
        else: chunks.append((kind, payload))
    decoded = zlib.decompress(idat)
    channels = {0: 1, 2: 3, 3: 1, 6: 4}[color_type]
    stride = (width * channels * bit_depth + 7) // 8
    bytes_per_pixel = max(1, (channels * bit_depth + 7) // 8)
    rows, offset, previous = [], 0, bytearray(stride)
    for _ in range(height):
        filter_type = decoded[offset]; offset += 1
        current = bytearray(decoded[offset:offset + stride]); offset += stride
        for index in range(stride):
            left = current[index - bytes_per_pixel] if index >= bytes_per_pixel else 0
            up = previous[index]
            upper_left = previous[index - bytes_per_pixel] if index >= bytes_per_pixel else 0
            if filter_type == 1: current[index] = (current[index] + left) & 255
            elif filter_type == 2: current[index] = (current[index] + up) & 255
            elif filter_type == 3: current[index] = (current[index] + ((left + up) // 2)) & 255
            elif filter_type == 4:
                estimate = left + up - upper_left
                distances = (abs(estimate - left), abs(estimate - up), abs(estimate - upper_left))
                current[index] = (current[index] + (left, up, upper_left)[distances.index(min(distances))]) & 255
            elif filter_type != 0: fail(f"{source}: unsupported PNG filter {filter_type}")
        rows.append(current); previous = current
    def pixels(row):
        if color_type == 0:
            values = []
            for byte in row:
                for shift in range(8 - bit_depth, -1, -bit_depth): values.append((byte >> shift) & ((1 << bit_depth) - 1))
            return [(value * 255 // ((1 << bit_depth) - 1),) * 3 + (255,) for value in values[:width]]
        if color_type == 3:
            values = []
            for byte in row:
                for shift in range(8 - bit_depth, -1, -bit_depth): values.append((byte >> shift) & ((1 << bit_depth) - 1))
            return [png_palette[value] + ((transparency[value] if value < len(transparency) else 255),) for value in values[:width]]
        return [tuple(row[index:index + channels]) if channels == 4 else tuple(row[index:index + 3]) + (255,) for index in range(0, width * channels, channels)]

    pixel_rows = [pixels(row) for row in rows]
    source_colors = sorted({pixel[:3] for row in pixel_rows for pixel in row}, key=lambda c: sum(c), reverse=True)
    palette = [tuple((channel * 255 + 15) // 31 for channel in color) for color in colors]
    brightness = [sum(color) for color in source_colors]
    brightest, darkest = max(brightness), min(brightness)
    span = max(1, brightest - darkest)
    mapping = {
        color: palette[min(3, int((brightest - sum(color)) * 3 / span + 0.5))]
        for color in source_colors
    }
    output_alpha = color_type == 6 or color_type == 3 and any(pixel[3] != 255 for row in pixel_rows for pixel in row)
    scanlines = bytearray()
    for row in pixel_rows:
        scanlines.append(0)
        for pixel in row:
            scanlines.extend(mapping[pixel[:3]])
            if output_alpha: scanlines.append(pixel[3])
    output = bytearray(b"\x89PNG\r\n\x1a\n")
    output.extend(png_chunk(b"IHDR", struct.pack(">IIBBBBB", width, height, 8, 6 if output_alpha else 2, 0, 0, 0)))
    output.extend(png_chunk(b"IDAT", zlib.compress(bytes(scanlines), 9)))
    output.extend(png_chunk(b"IEND", b""))
    destination.write_bytes(output)


def build(model, out):
    if out.exists(): shutil.rmtree(out)
    out.mkdir(parents=True)
    (out / "static").mkdir()
    shutil.copy2(ROOT / "site/static/site.css", out / "static/site.css")
    shutil.copy2(ROOT / "site/static/site.js", out / "static/site.js")
    shutil.copy2(ROOT / "site/static/favicon.png", out / "static/favicon.png")
    shutil.copy2(ROOT / "gfx/font/font.png", out / "static/font.png")
    shutil.copytree(ROOT / "docs", out / "docs")
    for p in model["pokemon"]:
        for source in p["sprites"].values():
            dest = out / source
            dest.parent.mkdir(parents=True, exist_ok=True)
            apply_palette(ROOT / source, dest, model["palettes"][p["palette"]])
    p_by_id = {p["id"]: p for p in model["pokemon"]}
    write_page(out, model, "", "Pokémon Amaranth", markdown_html(README_FILE.read_text(encoding="utf-8")))
    rows = ''.join(f'<article class="pokemon-card" data-filter-row><a href="{relative("pokemon/", p["_url"])}"><span class="sprite-frame"><img class="sprite" src="{relative("pokemon/", p["sprites"]["front"])}" alt="Front sprite of {esc(p["display_name"])}"></span><span class="dex-number">#{p["pokedex_number"]:03d}</span><span class="pokemon-name sprite-name">{esc(p["display_name"])}</span><span class="pokemon-types sprite-types">{type_html(p["types"])}</span></a></article>' for p in sorted(model["pokemon"], key=lambda x: x["pokedex_number"]))
    write_page(out, model, "pokemon/", "Pokémon", '<input class="filter" data-filter type="search" placeholder="Filter Pokémon" aria-label="Filter Pokémon"><div class="pokemon-grid">' + rows + '</div>')
    for p in model["pokemon"]:
        stat_labels = {"hp": "HP", "attack": "ATK", "defense": "DEF", "speed": "SPD", "special": "SPC"}
        current = p["_url"]; stats = ''.join(f'<div class="stat"><b>{stat_labels[s]}</b><span>{p["stats"][s]}</span><span class="bar"><i style="width:{min(100, p["stats"][s] / 2)}%"></i></span></div>' for s in STAT_FIELDS)
        evos = ''.join(f'<li>{("Level " + str(e["level"])) if e["method"] == "EVOLVE_LEVEL" else ("Trade" if e["method"] == "EVOLVE_TRADE" else item_link(model, current, model["items_by"][e["item"]]))} &rarr; {pokemon_link(model, current, p_by_id[e["species"]])}</li>' for e in p["evolutions"]) or '<li>None recorded</li>'
        learns = ''.join(f'<tr><td>{e["level"]}</td><td>{type_html([model["moves_by"][e["move"]]["type"]])}</td><td>{move_link(model, current, model["moves_by"][e["move"]])}</td><td data-sort-value="{esc(model["moves_by"][e["move"]]["power"])}">{"---" if model["moves_by"][e["move"]]["power"] in ("0", "1") else model["moves_by"][e["move"]]["power"]}{multi_hit_prefix(model["moves_by"][e["move"]])}</td><td>{model["moves_by"][e["move"]]["pp"]}</td><td>{model["moves_by"][e["move"]]["accuracy"]}%</td><td>{effect_html(model["moves_by"][e["move"]])}</td></tr>' for e in p["learnset"])
        machines = ''.join(f'<tr><td>{link(model, current, m["_url"], esc(m["kind"] + str(integer(m["number"])).zfill(2)))}</td><td>{type_html([model["moves_by"][move]["type"]])}</td><td>{move_link(model, current, model["moves_by"][move])}</td><td data-sort-value="{esc(model["moves_by"][move]["power"])}">{"---" if model["moves_by"][move]["power"] in ("0", "1") else model["moves_by"][move]["power"]}{multi_hit_prefix(model["moves_by"][move])}</td><td>{model["moves_by"][move]["pp"]}</td><td>{model["moves_by"][move]["accuracy"]}%</td><td>{effect_html(model["moves_by"][move])}</td></tr>' for move in p["tmhm"] for m in [model["machines_by_move"].get(move)] if m)
        sprite = lambda source: relative(current, source)
        pokedex_info = f'<div class="pokedex-info"><h2>Pokédex information</h2><p class="pokemon-category">{esc(p["pokedex"]["category"])}</p><dl><dt>Height</dt><dd>{p["pokedex"]["height"][0]}′ {p["pokedex"]["height"][1]}″</dd><dt>Weight</dt><dd>{p["pokedex"]["weight"] / 10:g} kg</dd></dl>{paragraphs(" ".join(sum(p["pokedex"]["description"], [])))}</div>'
        gameplay_info = f'<dl class="gameplay-info"><dt>Catch Difficulty</dt><dd>{gameplay_label(p["catch_rate"])}</dd><dt>EXP Yield</dt><dd>{gameplay_label(p["exp_yield"])}</dd><dt>Growth Rate</dt><dd>{gameplay_label(p["growth_rate"])}</dd></dl>'
        content = f'<section class="panel pokemon-overview"><div class="pokemon-identity"><div class="sprites"><div><img class="sprite" src="{sprite(p["sprites"]["front"])}" alt="Front sprite of {esc(p["display_name"])}"><div>Front</div></div><div><img class="sprite" src="{sprite(p["sprites"]["back"])}" alt="Back sprite of {esc(p["display_name"])}"><div>Back</div></div></div><dl><dt>Number</dt><dd>#{p["pokedex_number"]:03d}</dd><dt>Types</dt><dd>{type_html(p["types"])}</dd></dl>{gameplay_info}</div><div class="stats"><h2 class="stats-heading">Base stats</h2>{stats}<div class="stat-total"><b>BST</b><span>{sum(p["stats"].values())}</span></div></div>{pokedex_info}</section><h2>Evolution</h2><ul>{evos}</ul><h2>Level-up learnset</h2><div class="table-wrap"><table class="learnset-table" data-sortable><thead><tr><th>Level</th><th>Type</th><th>Move</th><th>Power</th><th>PP</th><th>Accuracy</th><th>Effect</th></tr></thead><tbody>{learns}</tbody></table></div><h2>TM/HM compatibility</h2><div class="table-wrap"><table class="machine-table" data-sortable><thead><tr><th>TM/HM</th><th>Type</th><th>Move</th><th>Power</th><th>PP</th><th>Accuracy</th><th>Effect</th></tr></thead><tbody>{machines}</tbody></table></div>'
        write_page(out, model, current, p["display_name"], content)
    move_rows = ''.join(f'<tr data-filter-row><td>{type_html([m["type"]])}</td><td>{move_link(model, "moves/", m)}</td><td data-sort-value="{esc(m["power"])}">{"---" if m["power"] in ("0", "1") else m["power"]}{multi_hit_prefix(m)}</td><td>{m["pp"]}</td><td>{m["accuracy"]}%</td><td data-sort-value="{esc(effect_title(m))}">{effect_html(m)}</td><td>{description(m["description_1"] + r"\n" + m["description_2"])}</td></tr>' for m in sorted(model["moves"], key=lambda move: move["name"].casefold()))
    write_page(out, model, "moves/", "Moves", '<input class="filter" data-filter type="search" placeholder="Filter moves" aria-label="Filter moves"><div class="table-wrap"><table class="moves-table" data-sortable><thead><tr><th>Type</th><th>Move</th><th>Power</th><th>PP</th><th>Accuracy</th><th>Effect</th><th>Description</th></tr></thead><tbody>' + move_rows + '</tbody></table></div>')
    for m in model["moves"]:
        current = m["_url"]; machine = model["machines_by_move"].get(m["constant"]); learners = ''.join(f'<li>{pokemon_link(model, current, x["pokemon"])} (level {x["level"]})</li>' for x in model["level_learners_by_move"].get(m["constant"], [])) or '<li>None recorded</li>'; compatible = ''.join(f'<li>{pokemon_link(model, current, p)}</li>' for p in model["machine_learners_by_move"].get(m["constant"], [])) or '<li>None recorded</li>'
        machine_text = f'<p>TM/HM: {link(model, current, machine["_url"], esc(machine["name"]))}</p>' if machine else ''
        content = f'<div class="panel"><dl><dt>Type</dt><dd>{type_html([m["type"]])}</dd><dt>Power</dt><dd>{m["power"] if m["power"] != "0" else "Status move"}</dd><dt>Accuracy</dt><dd>{m["accuracy"]}%</dd><dt>PP</dt><dd>{m["pp"]}</dd><dt>High critical hit</dt><dd>{"Yes" if m["high_crit"] == "true" else "No"}</dd></dl></div>{machine_text}<p>{description(m["description_1"] + r"\n" + m["description_2"])}</p><h2>Learned by level</h2><ul>{learners}</ul><h2>TM/HM compatibility</h2><ul>{compatible}</ul>'
        write_page(out, model, current, m["name"], content)
    public_items = [i for i in model["items"] if i["kind"] == "item" and i["symbol"] != "NO_ITEM" and not i["symbol"].startswith("UNUSED") and not i["symbol"].endswith("BADGE") and not i["aliases"]]
    item_rows = ''.join(f'<tr data-filter-row><td>{esc(i["id"])}</td><td>{item_link(model, "items/", i)}{" <span class=\"key-item-mark\" title=\"Key item\" aria-label=\"Key item\">⚿</span>" if i["key_item"] == "true" else ""}</td><td>{price(i["price"])}</td><td>{sell_price(i["price"])}</td><td>{description(i["description_text"])}</td></tr>' for i in public_items if i["symbol"] != "SAFARI_BALL")
    machine_rows = ''.join(f'<tr data-filter-row><td>{esc(m["item_id"])}</td><td>{type_html([model["moves_by"][m["move"]]["type"]])}</td><td>{link(model, "items/", m["_url"], esc(m["name"]))}</td><td>{move_link(model, "items/", model["moves_by"][m["move"]])}</td><td>{price(m["price"])}</td><td>{sell_price(m["price"])}</td><td>{description(model["moves_by"][m["move"]]["description_1"] + r"\n" + model["moves_by"][m["move"]]["description_2"])}</td></tr>' for m in model["machines"])
    write_page(out, model, "items/", "Items", '<input class="filter" data-filter type="search" placeholder="Filter items" aria-label="Filter items"><h2>Inventory items</h2><div class="table-wrap"><table class="inventory-table" data-sortable><thead><tr><th>Index</th><th>Item</th><th>Buy</th><th>Sell</th><th>Description</th></tr></thead><tbody>' + item_rows + '</tbody></table></div><h2>TMs/HMs</h2><div class="table-wrap"><table class="machine-index-table" data-sortable><thead><tr><th>Index</th><th>Type</th><th>Item</th><th>Move</th><th>Buy</th><th>Sell</th><th>Description</th></tr></thead><tbody>' + machine_rows + '</tbody></table></div>')
    ordinary_items = public_items
    for i in ordinary_items:
        current = i["_url"]; uses = ''.join(f'<li>{pokemon_link(model, current, u["source"])} &rarr; {pokemon_link(model, current, u["target"])}</li>' for u in model["evolution_users_by_item"].get(i["symbol"], [])); content = f'<div class="panel"><dl><dt>Price</dt><dd>{price(i["price"])}</dd><dt>Key item</dt><dd>{"Yes" if i["key_item"] == "true" else "No"}</dd></dl>{paragraphs(i["description_text"])}</div>' + (f'<h2>Evolution use</h2><ul>{uses}</ul>' if uses else '')
        write_page(out, model, current, i["name"], content)
    for machine in model["machines"]:
        current = machine["_url"]; move = model["moves_by"][machine["move"]]; compatible = ''.join(f'<li>{pokemon_link(model, current, p)}</li>' for p in model["machine_learners_by_move"].get(machine["move"], [])); content = f'<div class="panel"><dl><dt>TM/HM</dt><dd>{esc(machine["kind"])}{integer(machine["number"]):02d}</dd><dt>Move</dt><dd>{move_link(model, current, move)}</dd><dt>Type</dt><dd>{type_html([move["type"]])}</dd><dt>Power</dt><dd>{move["power"]}</dd><dt>Accuracy</dt><dd>{move["accuracy"]}%</dd><dt>PP</dt><dd>{move["pp"]}</dd><dt>Price</dt><dd>{price(machine["price"])}</dd></dl></div><p>{description(move["description_1"] + r"\n" + move["description_2"])}</p><h2>Compatible Pokémon</h2><ul>{compatible}</ul>'
        write_page(out, model, current, machine["name"], content)
    data = out / "data"; data.mkdir()
    def clean(record): return {k: v for k, v in record.items() if not k.startswith("_")}
    (data / "pokemon.json").write_text(json.dumps([clean(p) for p in model["pokemon"]], ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    (data / "moves.json").write_text(json.dumps(model["moves"], ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    (data / "items.json").write_text(json.dumps(model["items"] + model["machines"], ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    search = ([{"kind": "pokemon", "name": p["display_name"], "url": p["_url"]} for p in model["pokemon"]] + [{"kind": "move", "name": m["name"], "url": m["_url"]} for m in model["moves"]] + [{"kind": "item", "name": i["name"], "url": i["_url"]} for i in public_items] + [{"kind": m["kind"], "name": m["name"], "url": m["_url"]} for m in model["machines"]])
    (data / "search-index.json").write_text(json.dumps(search, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


def main(argv):
    try:
        model = validate(load_model()); indexes(model)
        if "--check" not in argv[1:]: build(model, Path(argv[1]) if len(argv) > 1 and not argv[1].startswith("-") else ROOT / "build/site")
        print("site data is valid" if "--check" in argv[1:] else "site generated")
        return 0
    except (OSError, ValueError, json.JSONDecodeError) as error:
        print(f"{argv[0]}: {error}", file=sys.stderr); return 1


if __name__ == "__main__": sys.exit(main(sys.argv))
