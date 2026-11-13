#!/usr/bin/env bash
# Snapshot live configuration into this folder. Never modifies live configs.
set -euo pipefail
DOTFILES_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
files=(
  .zshrc
  .zshenv
  .zprofile
  .zlogin
  .zlogout
  .tmux.conf
  .tmux/retitle-pane.sh
  .config/ghostty/config
  .config/ghostty/config.ghostty
)
for file in "${files[@]}"; do
  if [[ -f "$HOME/$file" ]]; then
    mkdir -p -- "$DOTFILES_DIR/$(dirname -- "$file")"
    cp -p -- "$HOME/$file" "$DOTFILES_DIR/$file"
    printf 'Synced %s\n' "$file"
  fi
done
printf 'Dotfiles synced to %s\n' "$DOTFILES_DIR"
