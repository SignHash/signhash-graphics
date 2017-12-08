INKSCAPE=inkscape

SVGFILES:=$(wildcard **/*.svg)
PNGFILES:=$(wildcard **/*.png)

RENDERDPI=300
PREVIEWDPI=90

DARKBG=\#4d4d4d
LIGHTBG=\#eeeeee

RENDER:=$(INKSCAPE) --without-gui --export-dpi=$(RENDERDPI) --export-area-drawing
LIGHTPREVIEW:=$(INKSCAPE) --without-gui --export-dpi=$(PREVIEWDPI) --export-background="$(LIGHTBG)"
DARKPREVIEW:=$(INKSCAPE) --without-gui --export-dpi=$(PREVIEWDPI) --export-background="$(DARKBG)"

PREVIEWS=\
		 logomark/signhash-logomark-light-preview.png

.PHONY: default previews light-previews dark-previews clean

all: default previews

default: $(SVGFILES:%.svg=%.png)

previews: light-previews dark-previews

light-previews: $(PREVIEWS:%.svg=%-light-preview.png)

dark-previews: $(PREVIEWS:%.svg=%-dark-preview.png)

%-light-preview.png: %.svg
	$(LIGHTPREVIEW) --export-png="$@" "$<"

%-dark-preview.png: %.svg
	$(DARKPREVIEW) --export-png="$@" "$<"

%.png: %.svg
	$(RENDER) --export-png="$*.png" "$*.svg"

clean:
	rm -f $(PNGFILES)

