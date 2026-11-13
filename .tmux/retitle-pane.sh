#!/usr/bin/env bash
set -euo pipefail

home="${HOME}"
mode="${1:-}"
pane="${2:-}"

title_for() {
  local cmd="$1" path="$2"
  case "$cmd" in
    zsh|bash|fish|sh|"")
      printf '%s' "${path/#$home/~}"
      ;;
    *)
      printf '%s' "$cmd"
      ;;
  esac
}

retitle_pane() {
  local target="$1"
  local cmd path title
  cmd="$(tmux display-message -t "$target" -p '#{pane_current_command}')"
  path="$(tmux display-message -t "$target" -p '#{pane_current_path}')"
  title="$(title_for "$cmd" "$path")"
  tmux select-pane -t "$target" -T "$title"
  printf '%s' "$title"
}

if [[ "$mode" == "--all" ]]; then
  while IFS= read -r p; do
    retitle_pane "$p" >/dev/null
  done < <(tmux list-panes -s -F '#{pane_id}')
  tmux display-message "Retitled all panes in session"
else
  # mode is pane id when called as: retitle-pane.sh %0
  target="${mode:-$TMUX_PANE}"
  title="$(retitle_pane "$target")"
  tmux display-message "Retitled → $title"
fi
