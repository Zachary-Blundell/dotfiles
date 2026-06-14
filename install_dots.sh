#!/bin/bash

REPO_URL="https://github.com/Zachary-Blundell/dotfiles"
REPO_NAME="dotfiles"
ROLE="${1}"
VALID_ROLES=(laptop desktop wsl android)

# ─── Validate Role ────────────────────────────────────────────────────────────
if [[ -z "$ROLE" ]]; then
  echo "Must provide role"
  echo "Usage: $0 [${VALID_ROLES[*]// /|}]"
  exit 1
fi

if [[ ! " ${VALID_ROLES[*]} " =~ " $ROLE " ]]; then
  echo "Invalid role: $ROLE"
  echo "Usage: $0 [${VALID_ROLES[*]// /|}]"
  exit 1
fi

# ─── Check Dependencies ──────────────────────────────────────────────────────
if ! command -v stow &>/dev/null; then
  echo "Install stow first"
  exit 1
fi

if ! command -v git &>/dev/null; then
  echo "Install git first"
  exit 1
fi

# ─── Clone Repository ────────────────────────────────────────────────────────

cd ~ || exit

if [[ -d "$REPO_NAME" ]]; then
  echo "Repository '$REPO_NAME' already exists. Pulling latest..."
  git -C "$REPO_NAME" pull --ff-only || echo "Warning: pull failed, continuing with existing state."
else
  echo "Cloning '$REPO_NAME'..."
  git clone "$REPO_URL"
fi

if [[ ! -d "$REPO_NAME" ]]; then
  echo "Failed to clone the repository."
  exit 1
fi

# ─── Define Package Layers ────────────────────────────────────────────────────
base=(nvim zellij zsh scripts)
omarchy=(zsh-omarchy hyprland hyprmon kanata kitty omarchy waybar)

declare -A role_packages
role_packages[laptop]="${omarchy[*]} hypr-laptop"
role_packages[desktop]="${omarchy[*]} hypr-desktop"
role_packages[wsl]="zsh-wsl"
role_packages[android]="zsh-android"

# ─── Remove Conflicting Configs ──────────────────────────────────────────────
echo "Removing old configs..."

targets=(
  .config/hypr
  .config/hyprmon
  .config/kanata
  .config/kitty
  .config/nvim
  .config/omarchy
  .config/waybar
  .config/zellij
  .config/zsh
  .local/bin
)

for target in "${targets[@]}"; do
  rm -rf "$HOME/$target"
done

# ─── Stow Packages ───────────────────────────────────────────────────────────

cd $HOME/dotfiles

echo "Stowing base packages..."
for pkg in "${base[@]}"; do
  stow "$pkg"
done

echo "Stowing $ROLE packages..."
for pkg in ${role_packages[$ROLE]}; do
  stow "$pkg"
done

echo "Done. Role '$ROLE' applied."
