#!/usr/bin/env bash

# Do not leave an unmatched glob as the literal string "files/*".
shopt -s nullglob

for file in files/*; do
    # Ignore directories or other non-regular entries inside files/.
    [[ -f "$file" ]] || continue

    filename=${file##*/}
    first_letter=${filename:0:1}
    destination=$(printf '%s' "$first_letter" | tr '[:upper:]' '[:lower:]')

    # The assignment supplies destination directories named a through z.
    if [[ "$destination" =~ ^[a-z]$ && -d "$destination" ]]; then
        mv -- "$file" "$destination/"
    fi
done
