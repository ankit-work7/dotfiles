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
# Keep Emacs configuration without downloaded packages or runtime state.
if [[ -d "$HOME/.config/emacs" ]]; then
  mkdir -p -- "$DOTFILES_DIR/.config/emacs"
  rsync -a \
    --exclude='/elpa/' --exclude='/eln-cache/' \
    --exclude='/auto-save-list/' --exclude='/var/' \
    --exclude='/tree-sitter/' --exclude='/url/' \
    --exclude='/history' --exclude='/recentf' --exclude='/places' \
    --exclude='/bookmarks' --exclude='/.org-id-locations' \
    --exclude='/org-roam.db*' --exclude='/projectile-*.eld' \
    --exclude='/session.*' --exclude='/.git/' \
    --exclude='*.elc' --exclude='*.eln' --exclude='*~' \
    --exclude='*.bak*' --exclude='*.before-*' --exclude='#*#' --exclude='.#*' \
    "$HOME/.config/emacs/" "$DOTFILES_DIR/.config/emacs/"
  printf 'Synced %s\n' '.config/emacs (configuration only)'
fi
printf 'Dotfiles synced to %s\n' "$DOTFILES_DIR"
