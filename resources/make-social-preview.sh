#!/bin/bash
INPUT="social-preview.typ"
CMD="compile"

if [[ "$1" == "watch" ]]; then
    CMD="$1"
fi

typst "$CMD" --format png --ppi 72 "$INPUT"
