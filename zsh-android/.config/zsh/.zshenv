#!/usr/bin/env zsh
# Shell Environment Initialization Script
# Android

# ─── Ink ─────────────────────────────────────────────────────────────────────
export INK_LEDGER="$HOME/windows/Documents/Notes/Logs/"

# ─── Editor ───────────────────────────────────────────────────────────────────
export EDITOR=nvim

# ─── PATH ─────────────────────────────────────────────────────────────────────
typeset -U PATH  # Deduplicate PATH entries

path=(
    "$HOME/.local/bin"
    $path
)

