#!/bin/zsh

BREWFILE_DIR="$HOME/.dotfiles/homebrew"
OUTPUT="$BREWFILE_DIR/Brewfile"

files=("${(@f)$(find "$BREWFILE_DIR" -maxdepth 1 -name '*.brewfile' -type f | sort)}")

if (( ${#files[@]} == 0 )); then
    echo "No .brewfile files found in $BREWFILE_DIR"
    exit 1
fi

selected=$(printf '%s\n' "${files[@]}" | fzf \
    --multi \
    --height=50% \
    --reverse \
    --border \
    --prompt="Select Brewfiles > " \
    --header="TAB to select • ENTER to build")

if [[ -z "$selected" ]]; then
    echo "Nothing selected."
    exit 0
fi

: > "$OUTPUT"

while IFS= read -r file; do
    echo "# ==================================================" >> "$OUTPUT"
    echo "# $(basename "$file")" >> "$OUTPUT"
    echo "# ==================================================" >> "$OUTPUT"
    cat "$file" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
done <<< "$selected"

echo "Built: $OUTPUT"

