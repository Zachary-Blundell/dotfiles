#!/usr/bin/env bash
# rotate-toggle.sh — Toggle the focused Hyprland monitor between 0° and 90°
# No arguments needed. Detects the currently focused output automatically.

# --- Step 1: fetch JSON data for all monitors --------------------------------
json="$(hyprctl monitors -j 2>/dev/null)"
if [[ -z $json ]]; then
  echo "hyprctl returned no data; is Hyprland running?" >&2
  exit 1
fi

# --- Step 2: identify the focused monitor and its current transform ----------
if command -v jq >/dev/null 2>&1; then
  FOCUSED_MONITOR=$(jq -r '.[] | select(.focused == true) | .name' <<<"$json")
  CURRENT_TRANSFORM=$(jq -r '.[] | select(.focused == true) | .transform' <<<"$json")
else
  # Fallback parser (works without jq, but less robust)
  FOCUSED_MONITOR=$(echo "$json" | grep -E '"focused":\s*true' -B3 |
    grep '"name":' | head -n1 |
    sed -E 's/.*"name":\s*"([^"]+)".*/\1/')
  CURRENT_TRANSFORM=$(echo "$json" | grep -E '"focused":\s*true' -B7 |
    grep '"transform":' | head -n1 |
    tr -dc '0-9')
fi

if [[ -z $FOCUSED_MONITOR ]]; then
  echo "Could not determine the focused monitor." >&2
  exit 1
fi
[[ -z $CURRENT_TRANSFORM ]] && CURRENT_TRANSFORM=0 # default to normal

# --- Step 3: toggle between landscape (0) and portrait (1) -------------------
if [[ $CURRENT_TRANSFORM -eq 0 ]]; then
  NEW_TRANSFORM=1 # rotate to 90°
else
  NEW_TRANSFORM=0 # revert to 0°
fi

hyprctl keyword monitor "${FOCUSED_MONITOR},transform,${NEW_TRANSFORM}"
