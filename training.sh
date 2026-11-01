#!/bin/sh
set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

if [ -n "${GODOT:-}" ]; then
	GODOT_BIN=$GODOT
elif command -v godot >/dev/null 2>&1; then
	GODOT_BIN=$(command -v godot)
elif command -v godot4 >/dev/null 2>&1; then
	GODOT_BIN=$(command -v godot4)
else
	printf '%s\n' 'Godot 4.7.2 was not found. Install the standard Godot build or set GODOT to its executable.' >&2
	exit 1
fi

exec "$GODOT_BIN" --path "$ROOT/game" -- --training "$@"
