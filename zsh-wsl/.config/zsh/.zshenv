#!/usr/bin/env zsh
# Shell Environment Initialization Script
# WSL version

# ─── Ink ─────────────────────────────────────────────────────────────────────
export INK_LEDGER="$HOME/windows/Documents/Notes/Logs/"

# ─── Locale ───────────────────────────────────────────────────────────────────
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# ─── Editor ───────────────────────────────────────────────────────────────────
export EDITOR=nvim

# ─── Misc ─────────────────────────────────────────────────────────────────────
export LESSHISTFILE="${LESSHISTFILE:-/tmp/less-hist}"

# ─── Ruby ─────────────────────────────────────────────────────────────────────
export GEM_HOME="$HOME/gems"
export RUBY_HOME="$HOME/.local/share/gem/ruby/3.4.0"

# ─── Bun ──────────────────────────────────────────────────────────────────────
export BUN_INSTALL="$HOME/.bun"

# ─── NVM ──────────────────────────────────────────────────────────────────────
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ─── Bun Completions ─────────────────────────────────────────────────────────
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# ─── PATH ─────────────────────────────────────────────────────────────────────
typeset -U PATH  # Deduplicate PATH entries

path=(
    "$HOME/.local/bin"
    "$BUN_INSTALL/bin"
    "$RUBY_HOME/bin"
    "$GEM_HOME/bin"
    $path
)

# Append gem environment bin directories
export PATH="$PATH:$(gem env path | sed 's#[^:]\+#&/bin#g')"
