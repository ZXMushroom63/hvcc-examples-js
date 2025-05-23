SHELL:=/bin/bash

all: hvcc html

PLUGINS = chip krell synth_simple stereo_panner envelope_follower

html: hvcc
	$(foreach var, $(PLUGINS), mkdir _site/$(var);)
	$(foreach var, $(PLUGINS), mv $(var)/js/* _site/$(var)/;)

hvcc:
	$(foreach var, $(PLUGINS), hvcc js_$(var).pd -n $(var) -o $(var) -g js -p examples examples/heavylib;)

clean:
	$(foreach var, $(PLUGINS), rm -rf _site/$(var);)
