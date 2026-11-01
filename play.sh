#!/bin/sh
set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

if [ -n "${GODOT:-}" ]; then
	GODOT_BIN=$GODOT
elif command -v godot >/dev/null 2>&1; then
	GODOT_BIN=$(command -v godot)
elif command -v godot4 >/dev/null 2>&1; then
	GODOT_BIN=$(command -v godot4)
elif [ -x /Applications/Godot.app/Contents/MacOS/Godot ]; then
	GODOT_BIN=/Applications/Godot.app/Contents/MacOS/Godot
elif [ -x "$HOME/Applications/Godot.app/Contents/MacOS/Godot" ]; then
	GODOT_BIN="$HOME/Applications/Godot.app/Contents/MacOS/Godot"
else
	printf '%s\n' 'Godot was not found. Install Godot 4.7.2 or set GODOT to its executable.' >&2
	exit 1
fi

exec "$GODOT_BIN" --path "$ROOT/game" -- "$@"
