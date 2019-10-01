OPENSCAD = openscad
SCAD = $(filter-out Case.scad Base.scad, $(wildcard *.scad))
STL = $(SCAD:.scad=.stl)

all: stl image

stl: $(STL)

image:
	mkdir -p images/
	$(OPENSCAD) --render -o images/MaiskolbenCase.png Case.scad

%.stl: %.scad | output
	$(OPENSCAD) -o output/$@ $^

output:
	mkdir -p output/

clean:
	rm -Rf output/ images/
