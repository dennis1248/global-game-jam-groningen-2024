#!/bin/sh
echo -ne '\033c\033]0;Global Game Jam Groningen 2024\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Global Game Jam Groningen 2024.x86_64" "$@"
