#!/bin/bash
#    ______           __  ______          __ 
#   / ____/________ _/ /_/_  __/__  _  __/ /_
#  / / __/ ___/ __ `/ __ \/ / / _ \| |/_/ __/
# / /_/ / /  / /_/ / /_/ / / /  __/>  </ /_  
# \____/_/   \__,_/_.___/_/  \___/_/|_|\__/  
                                           
# Exit immediately if a command fails.
set -euo pipefail

IMG="$(mktemp /tmp/ocr.XXXXXX.png)"

# Make sure the temporary file is deleted when the script exits,
# even if something fails or you cancel midway through.
trap 'rm -f "$IMG"' EXIT

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/grab-text"
LANG_FILE="$CONFIG_DIR/language"

# Default to English if no language has been chosen yet.
LANG="eng"
if [ -f "$LANG_FILE" ]; then
    LANG="$(cat "$LANG_FILE")"
fi

# Capture a user-selected screen region.
grim -g "$(slurp)" "$IMG"

# OCR the image with the saved language and copy the result to the clipboard.
if tesseract "$IMG" stdout -l "$LANG" 2>/dev/null | wl-copy; then
    notify-send "OCR" "Copied text to clipboard using language: $LANG"
else
    notify-send "OCR" "OCR failed."
    exit 1
fi
