INKSCAPE=inkscape

SVGFILES:=$(wildcard **/*.svg)
PNGFILES:=$(wildcard **/*.png)

RENDERDPI=300

DARKBG=\#4d4d4d
LIGHTBG=\#eeeeee

RENDER:=$(INKSCAPE) --without-gui --export-dpi=$(RENDERDPI)

.PHONY: default clean

all: default

default: $(SVGFILES:%.svg=%.png)

%.png: %.svg
	$(RENDER) --export-png="$*.png" "$*.svg"

clean:
	rm -f $(PNGFILES)

