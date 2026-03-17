#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"
EDITOR="${EDITOR:-nvim}"

command -v fd >/dev/null 2>&1 || {
  printf 'fd not found\n' >&2
  exit 1
}

command -v walker >/dev/null 2>&1 || {
  printf 'walker not found\n' >&2
  exit 1
}

command -v xdg-terminal-exec >/dev/null 2>&1 || {
  printf 'xdg-terminal-exec not found\n' >&2
  exit 1
}

entries="$(
  fd . "$DOTFILES_DIR" \
    --mindepth 1 \
    --maxdepth 1 \
    --hidden \
    --exclude=.git \
    --exclude=.gitignore \
    --exclude=.gitconfig \
    --exec basename {} \; \
  | sort
)"

choice="$(
  printf '%s\n' "$entries" | walker --dmenu --placeholder "Edit dotfiles"
)"

[ -n "${choice:-}" ] || exit 0

base="$DOTFILES_DIR/$choice"

resolve_target() {
  local choice="$1"
  local base="$2"
  local target=""
  local config_dir=""

  case "$choice" in
    # top-level files
    .bashrc|.gitconfig|.gitignore)
      target="$base"
      ;;

    # oddballs / exceptions
    scripts)
      target="$base/.local/bin"
      ;;

    zsh)
      target="$base/.config/zsh"
      ;;

    # generic rule:
    # if the top-level entry contains .config with exactly one dir inside it,
    # open that dir
    *)
      if [ -f "$base" ]; then
        target="$base"
      elif [ -d "$base/.config" ]; then
        config_dir="$(
          fd . "$base/.config" \
            --mindepth 1 \
            --maxdepth 1 \
            --type d \
          | head -n 1
        )"

        [ -n "${config_dir:-}" ] || {
          printf 'No config directory found in %s\n' "$base/.config" >&2
          return 1
        }

        target="$config_dir"
      else
        printf 'Could not resolve target for %s\n' "$choice" >&2
        return 1
      fi
      ;;
  esac

  [ -e "$target" ] || {
    printf 'Resolved target does not exist: %s\n' "$target" >&2
    return 1
  }

  printf '%s\n' "$target"
}

target="$(resolve_target "$choice" "$base")"

if [ -d "$target" ]; then
  workdir="$target"
  edit_target="."
else
  workdir="$(dirname "$target")"
  edit_target="$target"
fi

exec xdg-terminal-exec --dir="$workdir" "$EDITOR" "$edit_target"
