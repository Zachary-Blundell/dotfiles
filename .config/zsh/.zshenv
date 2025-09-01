#!/usr/bin/env zsh

for file in "${ZDOTDIR:-$HOME/.config/zsh}/zdeenv/"*.zsh; do
  [ -r "$file" ] && source "$file"
done
