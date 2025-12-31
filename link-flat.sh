#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 3 ]; then
    echo "Usage: $0 SRC DST ext1 [ext2 ...]"
    exit 1
fi

SRC="$(realpath "$1")"
DST="$(realpath "$2")"
shift 2
EXTS=("$@")

mkdir -p "$DST"
cd "$SRC" || exit 1

# Build find expression
FIND_EXPR=()
for ext in "${EXTS[@]}"; do
    FIND_EXPR+=( -iname "*.${ext}" -o )
done
unset 'FIND_EXPR[-1]'

# Flatten and symlink
find . -type f \( "${FIND_EXPR[@]}" \) -print0 |
while IFS= read -r -d '' file; do
    src_file="$SRC/$file"
    base="$(basename "$file")"
    target="$DST/$base"

    # Handle filename collisions
    if [ -e "$target" ]; then
        i=1
        name="${base%.*}"
        ext="${base##*.}"
        while [ -e "$DST/${name}_${i}.${ext}" ]; do
            ((i++))
        done
        target="$DST/${name}_${i}.${ext}"
    fi

    ln -sf "$src_file" "$target"
done
