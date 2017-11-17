INKSCAPE=inkscape
SVGFILES:=$(wildcard **/*.svg)
PNGFILES:=$(wildcard **/*.png)

.PHONY: clean

all: $(SVGFILES:%.svg=%.png)

clean:
	rm -f $(PNGFILES)

%.png: %.svg
	$(INKSCAPE) --without-gui --export-png="$*.png" --export-width=800 "$*.svg"

