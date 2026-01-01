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

cd "$SRC" || exit 1

# Build find expression dynamically
FIND_EXPR=()
for ext in "${EXTS[@]}"; do
    FIND_EXPR+=( -iname "*.${ext}" -o )
done
unset 'FIND_EXPR[-1]'   # remove trailing -o

# Find matching files and create dirs only as needed
find . -type f \( "${FIND_EXPR[@]}" \) -print0 |
while IFS= read -r -d '' file; do
    src_file="$SRC/$file"
    target="$DST/$file"

    # Create directory only if a kept file exists
    mkdir -p "$(dirname "$target")"

    if [ -e "$target" ]; then
        # Same inode or same content → keep existing file
        if [ "$src_file" -ef "$target" ] || cmp -s "$src_file" "$target"; then
            continue
        fi

        # Different content → replace
        rm -f "$target"
    fi

    # Create hard link
    ln "$src_file" "$target"
done
