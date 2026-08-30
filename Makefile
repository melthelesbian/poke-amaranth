roms := \
	amaranth.gbc \
	amaranth_debug.gbc \
	amaranth_red.gbc \
	amaranth_red_debug.gbc \
	amaranth_blue.gbc \
	amaranth_blue_debug.gbc
patches := \
	amaranth_red.patch \
	amaranth_blue.patch

move_csv := data/moves/moves.csv
item_csv := data/items/items.csv
machine_csv := data/items/machines.csv
move_generated := \
	constants/moves.gen.asm \
	data/moves/moves.gen.asm \
	data/moves/names.gen.asm \
	data/moves/descriptions.gen.asm \
	data/moves/sfx.gen.asm \
	data/moves/animation_pointers.gen.asm \
	data/battle/critical_hit_moves.gen.asm
item_generated := \
	constants/item_constants.gen.asm \
	data/items/names.gen.asm \
	data/items/prices.gen.asm \
	data/items/key_items.gen.asm \
	data/items/item_use_pointers.gen.asm \
	data/items/use_party.gen.asm \
	data/items/use_overworld.gen.asm \
	data/items/guard_drink_items.gen.asm \
	data/items/vending_prices.gen.asm \
	data/items/descriptions.gen.asm \
	data/items/tm_prices.gen.asm
pokemon_json := $(wildcard data/pokemon/species/*.json)
pokemon_generated := $(foreach json,$(pokemon_json),data/pokemon/base_stats/$(notdir $(json:.json=.gen.asm)) data/pokemon/evos_moves/$(notdir $(json:.json=.gen.asm)))
pokemon_pics := $(patsubst %.png,%.pic,$(wildcard gfx/pokemon/front/*.png gfx/pokemon/back/*.png))

rom_obj := \
	audio.o \
	home.o \
	main.o \
	maps.o \
	ram.o \
	text.o \
	gfx/pics.o \
	gfx/sprites.o \
	gfx/tilesets.o

amaranth_obj            := $(rom_obj:.o=_amrnth.o)
amaranth_debug_obj      := $(rom_obj:.o=_amrnth_debug.o)
amaranth_red_obj        := $(rom_obj:.o=_amrnth_red.o)
amaranth_red_debug_obj  := $(rom_obj:.o=_amrnth_red_debug.o)
amaranth_blue_obj       := $(rom_obj:.o=_amrnth_blue.o)
amaranth_blue_debug_obj := $(rom_obj:.o=_amrnth_blue_debug.o)
amaranth_red_vc_obj     := $(rom_obj:.o=_amrnth_red_vc.o)
amaranth_blue_vc_obj    := $(rom_obj:.o=_amrnth_blue_vc.o)


### Build tools

ifeq (,$(shell which sha1sum))
SHA1 := shasum
else
SHA1 := sha1sum
endif

RGBDS ?=
RGBASM  ?= $(RGBDS)rgbasm
RGBFIX  ?= $(RGBDS)rgbfix
RGBGFX  ?= $(RGBDS)rgbgfx
RGBLINK ?= $(RGBDS)rgblink


### Build targets

.SUFFIXES:
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:
.PHONY: all amaranth red blue blue_debug clean tidy compare tools

amaranth:       amaranth.gbc
amaranth_debug: amaranth_debug.gbc
red:            amaranth_red.gbc
red_debug:      amaranth_red_debug.gbc
blue:           amaranth_blue.gbc
blue_debug:     amaranth_blue_debug.gbc
red_vc:         amaranth_red.patch
blue_vc:        amaranth_blue.patch
all: $(roms) $(patches)

clean: tidy
	find gfx \
	     \( -iname '*.1bpp' \
	        -o -iname '*.2bpp' \
	        -o -iname '*.pic' \) \
	     -delete

tidy:
	$(RM) $(roms) \
	      $(roms:.gbc=.sym) \
	      $(roms:.gbc=.map) \
	      $(patches) \
	      $(patches:.patch=_vc.gbc) \
	      $(patches:.patch=_vc.sym) \
	      $(patches:.patch=_vc.map) \
	      $(patches:%.patch=vc/%.constants.sym) \
		  $(amaranth_obj) \
	      $(amaranth_red_obj) \
	      $(amaranth_blue_obj) \
	      $(amaranth_red_vc_obj) \
	      $(amaranth_blue_vc_obj) \
		  $(amaranth_debug_obj) \
		  $(amaranth_red_debug_obj) \
	      $(amaranth_blue_debug_obj) \
	      rgbdscheck.o
	find . -type f -name '*.gen.asm' -delete
	$(MAKE) clean -C tools/

compare: $(roms) $(patches)
	@$(SHA1) -c roms.sha1

tools:
	$(MAKE) -C tools/


RGBASMFLAGS = -Q8 -P includes.asm -Weverything -Wtruncation=1
# Create a sym/map for debug purposes if `make` run with `DEBUG=1`
ifeq ($(DEBUG),1)
RGBASMFLAGS += -E
endif

$(amaranth_obj):            RGBASMFLAGS += -D _AMARANTH
$(amaranth_debug_obj):      RGBASMFLAGS += -D _AMARANTH -D _DEBUG
$(amaranth_red_obj):        RGBASMFLAGS += -D _RED
$(amaranth_red_debug_obj):  RGBASMFLAGS += -D _RED -D _DEBUG
$(amaranth_blue_obj):       RGBASMFLAGS += -D _BLUE
$(amaranth_blue_debug_obj): RGBASMFLAGS += -D _BLUE -D _DEBUG
$(amaranth_red_vc_obj):     RGBASMFLAGS += -D _RED -D _RED_VC
$(amaranth_blue_vc_obj):    RGBASMFLAGS += -D _BLUE -D _BLUE_VC

%.patch: vc/%.constants.sym %_vc.gbc %.gbc vc/%.patch.template
	tools/make_patch $*_vc.sym $^ $@

rgbdscheck.o: rgbdscheck.asm
	$(RGBASM) -o $@ $<

# Build tools when building the rom.
# This has to happen before the rules are processed, since that's when scan_includes is run.
ifeq (,$(filter clean tidy tools,$(MAKECMDGOALS)))

$(info $(shell $(MAKE) -C tools))

# The dep rules have to be explicit or else missing files won't be reported.
# As a side effect, they're evaluated immediately instead of when the rule is invoked.
# It doesn't look like $(shell) can be deferred so there might not be a better way.
preinclude_deps := includes.asm $(shell tools/scan_includes includes.asm)
define DEP
$1: $2 $$(shell tools/scan_includes $2) $(preinclude_deps) | rgbdscheck.o
	$$(RGBASM) $$(RGBASMFLAGS) -o $$@ $$<
endef

# Dependencies for objects (drop _red and _blue from asm file basenames)
$(foreach obj, $(amaranth_obj), $(eval $(call DEP,$(obj),$(obj:_amrnth.o=.asm))))
$(foreach obj, $(amaranth_debug_obj), $(eval $(call DEP,$(obj),$(obj:_amrnth_debug.o=.asm))))
$(foreach obj, $(amaranth_red_obj), $(eval $(call DEP,$(obj),$(obj:_amrnth_red.o=.asm))))
$(foreach obj, $(amaranth_red_debug_obj), $(eval $(call DEP,$(obj),$(obj:_amrnth_red_debug.o=.asm))))
$(foreach obj, $(amaranth_blue_obj), $(eval $(call DEP,$(obj),$(obj:_amrnth_blue.o=.asm))))
$(foreach obj, $(amaranth_blue_debug_obj), $(eval $(call DEP,$(obj),$(obj:_amrnth_blue_debug.o=.asm))))
$(foreach obj, $(amaranth_red_vc_obj), $(eval $(call DEP,$(obj),$(obj:_amrnth_red_vc.o=.asm))))
$(foreach obj, $(amaranth_blue_vc_obj), $(eval $(call DEP,$(obj),$(obj:_amrnth_blue_vc.o=.asm))))

# Dependencies for VC files that need to run scan_includes
%.constants.sym: %.constants.asm $(shell tools/scan_includes %.constants.asm) $(preinclude_deps) | rgbdscheck.o
	$(RGBASM) $(RGBASMFLAGS) $< > $@

constants/moves.gen.asm: $(move_csv) tools/generate_moves.py
	python3 tools/generate_moves.py constants $(move_csv) > $@

data/moves/moves.gen.asm: $(move_csv) tools/generate_moves.py
	python3 tools/generate_moves.py moves $(move_csv) > $@

data/moves/names.gen.asm: $(move_csv) tools/generate_moves.py
	python3 tools/generate_moves.py names $(move_csv) > $@

data/moves/descriptions.gen.asm: $(move_csv) tools/generate_moves.py
	python3 tools/generate_moves.py descriptions $(move_csv) > $@

data/moves/sfx.gen.asm: $(move_csv) tools/generate_moves.py
	python3 tools/generate_moves.py sfx $(move_csv) > $@

data/moves/animation_pointers.gen.asm: $(move_csv) tools/generate_moves.py
	python3 tools/generate_moves.py animation-pointers $(move_csv) > $@

data/battle/critical_hit_moves.gen.asm: $(move_csv) tools/generate_moves.py
	python3 tools/generate_moves.py critical-hits $(move_csv) > $@

constants/item_constants.gen.asm: $(item_csv) $(machine_csv) $(move_csv) tools/generate_items.py
	python3 tools/generate_items.py constants > $@

data/items/names.gen.asm: $(item_csv) $(machine_csv) $(move_csv) tools/generate_items.py
	python3 tools/generate_items.py names > $@

data/items/prices.gen.asm: $(item_csv) $(machine_csv) $(move_csv) tools/generate_items.py
	python3 tools/generate_items.py prices > $@

data/items/key_items.gen.asm: $(item_csv) $(machine_csv) $(move_csv) tools/generate_items.py
	python3 tools/generate_items.py key-items > $@

data/items/item_use_pointers.gen.asm: $(item_csv) $(machine_csv) $(move_csv) tools/generate_items.py
	python3 tools/generate_items.py use > $@

data/items/use_party.gen.asm: $(item_csv) $(machine_csv) $(move_csv) tools/generate_items.py
	python3 tools/generate_items.py party > $@

data/items/use_overworld.gen.asm: $(item_csv) $(machine_csv) $(move_csv) tools/generate_items.py
	python3 tools/generate_items.py close > $@

data/items/guard_drink_items.gen.asm: $(item_csv) $(machine_csv) $(move_csv) tools/generate_items.py
	python3 tools/generate_items.py guard > $@

data/items/vending_prices.gen.asm: $(item_csv) $(machine_csv) $(move_csv) tools/generate_items.py
	python3 tools/generate_items.py vending > $@

data/items/descriptions.gen.asm: $(item_csv) $(machine_csv) $(move_csv) tools/generate_items.py
	python3 tools/generate_items.py descriptions > $@

data/items/tm_prices.gen.asm: $(item_csv) $(machine_csv) $(move_csv) tools/generate_items.py
	python3 tools/generate_items.py tm-prices > $@

$(filter data/pokemon/base_stats/%,$(pokemon_generated)): data/pokemon/base_stats/%.gen.asm: data/pokemon/species/%.json tools/generate_pokemon.py $(pokemon_pics)
	python3 tools/generate_pokemon.py generate-one $*

$(filter data/pokemon/evos_moves/%,$(pokemon_generated)): data/pokemon/evos_moves/%.gen.asm: data/pokemon/species/%.json tools/generate_pokemon.py data/pokemon/base_stats/%.gen.asm
	@test -f $@ || python3 tools/generate_pokemon.py generate-one $*

endif


%.asm: ;

amaranth_pad            = 0x00
amaranth_debug_pad      = 0x00
amaranth_red_pad        = 0x00
amaranth_red_debug_pad  = 0xff
amaranth_blue_pad       = 0x00
amaranth_red_vc_pad     = 0x00
amaranth_blue_vc_pad    = 0x00
amaranth_blue_debug_pad = 0xff

amaranth_opt            = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "AMARANTH 25"
amaranth_debug_opt      = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "AMARANTH 25"
amaranth_red_opt        = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON RED"
amaranth_red_debug_opt  = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON RED"
amaranth_blue_opt       = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON BLUE"
amaranth_blue_debug_opt = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON BLUE"
amaranth_red_vc_opt     = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON RED"
amaranth_blue_vc_opt    = -jsv -n 0 -k 01 -l 0x33 -m 0x13 -r 03 -t "POKEMON BLUE"

%.gbc: $$(%_obj) layout.link
	$(RGBLINK) -p $($*_pad) -d -m $*.map -n $*.sym -l layout.link -o $@ $(filter %.o,$^)
	$(RGBFIX) -p $($*_pad) $($*_opt) $@


### Misc file-specific graphics rules

gfx/battle/move_anim_0.2bpp: tools/gfx += --trim-whitespace
gfx/battle/move_anim_1.2bpp: tools/gfx += --trim-whitespace

gfx/intro/blue_jigglypuff_1.2bpp: rgbgfx += --columns
gfx/intro/blue_jigglypuff_2.2bpp: rgbgfx += --columns
gfx/intro/blue_jigglypuff_3.2bpp: rgbgfx += --columns
gfx/intro/red_nidorino_1.2bpp: rgbgfx += --columns
gfx/intro/red_nidorino_2.2bpp: rgbgfx += --columns
gfx/intro/red_nidorino_3.2bpp: rgbgfx += --columns
gfx/intro/gengar.2bpp: rgbgfx += --columns
gfx/intro/gengar.2bpp: tools/gfx += --remove-duplicates --preserve=0x19,0x76

gfx/credits/the_end.2bpp: tools/gfx += --interleave --png=$<

gfx/slots/red_slots_1.2bpp: tools/gfx += --trim-whitespace
gfx/slots/blue_slots_1.2bpp: tools/gfx += --trim-whitespace

gfx/tilesets/%.2bpp: tools/gfx += --trim-whitespace
gfx/tilesets/reds_house.2bpp: tools/gfx += --preserve=0x48

gfx/trade/game_boy.2bpp: tools/gfx += --remove-duplicates


### Catch-all graphics rules

%.png: ;

%.2bpp: %.png
	$(RGBGFX) $(rgbgfx) -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -o $@ $@)

%.1bpp: %.png
	$(RGBGFX) $(rgbgfx) --depth 1 -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) --depth 1 -o $@ $@)

%.pic: %.2bpp
	tools/pkmncompress $< $@
