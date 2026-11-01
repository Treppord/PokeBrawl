.DEFAULT_GOAL := help

GODOT ?=
ARGS ?=

.PHONY: help run training build build-macos

help:
	@printf '%s\n' \
		'make run          Run PokeBrawl from the Godot project' \
		'make training     Run with training mode selected' \
		'make build        Export export/PokeBrawl/PokeBrawl.app' \
		'make build-macos  Same as make build' \
		'' \
		'Options: GODOT=/path/to/Godot  ARGS="--lang=en"'

run:
	@GODOT="$(GODOT)" ./play.sh $(ARGS)

training:
	@GODOT="$(GODOT)" ./training.sh $(ARGS)

build: build-macos

build-macos:
	@GODOT="$(GODOT)" ./build-macos.sh
