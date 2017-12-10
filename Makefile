INKSCAPE=inkscape
CONVERT=convert

SVGFILES:=$(wildcard **/*.svg)
PNGFILES:=$(wildcard **/*.png)

RENDERDPI=300

DARKBG=\#4d4d4d
LIGHTBG=\#eeeeee

RENDER:=$(INKSCAPE) --without-gui --export-dpi=$(RENDERDPI)

.PHONY: default clean favicon

all: default favicon

default: $(SVGFILES:%.svg=%.png)

favicon: favicon.ico

%.png: %.svg
	$(RENDER) --export-png="$*.png" "$*.svg"

favicon.ico: logomark/signhash-logomark-small.png
	$(CONVERT) -resize x32 -gravity center -crop 32x32+0+0 "$<" -flatten -colors 256 "$@"

clean:
	rm -f $(PNGFILES)

