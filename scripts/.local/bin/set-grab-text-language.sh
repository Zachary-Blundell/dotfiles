#!/bin/bash

# Exit on errors, on unset variables, and on failed pipes.
set -euo pipefail

# Where to store the selected Tesseract language.
# This will contain a simple value like:
#   eng
# or
#   eng+fra
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/grab-text"
LANG_FILE="$CONFIG_DIR/language"

# Create the config directory if it does not already exist.
mkdir -p "$CONFIG_DIR"

# Get the list of installed Tesseract languages.
# "tesseract --list-langs" prints a header line first, then the language codes.
# Example:
#   List of available languages in "/usr/share/tessdata/" (3):
#   eng
#   fra
LANGS="$(
    tesseract --list-langs 2>/dev/null \
    | tail -n +2
)"

# Abort if no languages were found.
if [ -z "$LANGS" ]; then
    notify-send "OCR language" "No Tesseract languages found."
    exit 1
fi

# Show the languages in Walker dmenu mode and let the user choose one.
# -d enables dmenu mode
# -p sets the prompt / placeholder text
SELECTED="$(
    printf '%s\n' "$LANGS" \
    | walker -d -p "Select OCR language"
)"

# If the user cancelled the menu, do nothing.
if [ -z "${SELECTED:-}" ]; then
    exit 0
fi

# Save the chosen language code for other scripts to use later.
printf '%s\n' "$SELECTED" > "$LANG_FILE"

# Notify the user.
notify-send "OCR language" "Set Tesseract language to: $SELECTED"
