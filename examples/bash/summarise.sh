#!/usr/bin/env bash
set -euo pipefail

input="${1:-data.csv}"

if [[ ! -f "$input" ]]; then
  printf 'File not found: %s\n' "$input" >&2
  exit 1
fi

printf 'Lines in %s: ' "$input"
wc -l < "$input"

printf 'First 5 lines:\n'
head -n 5 "$input"
