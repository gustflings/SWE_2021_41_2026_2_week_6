#!/usr/bin/env bash

shopt -s nullglob

for file in files/*; do
    [[ -f "$file" ]] || continue

    filename=${file##*/}
    first_letter=${filename:0:1}
    destination=$(printf '%s' "$first_letter" | tr '[:upper:]' '[:lower:]')

    if [[ "$destination" =~ ^[a-z]$ && -d "$destination" ]]; then
        mv -- "$file" "$destination/"
    fi
done
