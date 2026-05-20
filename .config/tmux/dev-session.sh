#!/usr/bin/env bash
set -euo pipefail

SESSION_NAME="${1:-dev}"
PROJECTS_DIR="${PROJECTS_DIR:-/workspace/projects}"
APP_DIR="${APP_DIR:-$PROJECTS_DIR/ajedrezlapaz}"
DOTFILES_DIR="${DOTFILES_DIR:-$PROJECTS_DIR/.dotfiles}"
SHELL_BIN="${SHELL:-/bin/zsh}"

attach_or_switch() {
  if [ -n "${TMUX:-}" ]; then
    tmux switch-client -t "$SESSION_NAME"
  else
    tmux attach-session -t "$SESSION_NAME"
  fi
}

if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
  attach_or_switch
  exit 0
fi

tmux new-session -d -s "$SESSION_NAME" -n app -c "$APP_DIR" "$SHELL_BIN"
tmux new-window -t "$SESSION_NAME:" -n agy -c "$APP_DIR" "$SHELL_BIN"
tmux new-window -t "$SESSION_NAME:" -n htop -c "$PROJECTS_DIR" "htop; exec $SHELL_BIN"
tmux new-window -t "$SESSION_NAME:" -n dotfiles -c "$DOTFILES_DIR" "$SHELL_BIN"
tmux new-window -t "$SESSION_NAME:" -n node -c "$APP_DIR" "$SHELL_BIN"
tmux new-window -t "$SESSION_NAME:" -n helper -c "$APP_DIR" "$SHELL_BIN"

tmux select-window -t "$SESSION_NAME:app"
attach_or_switch
