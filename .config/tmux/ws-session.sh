#!/usr/bin/env bash
set -euo pipefail

SESSION_NAME="${1:-dev}"
PROJECTS_DIR="${PROJECTS_DIR:-/alp}"
WEB_DIR="${WEB_DIR:-$PROJECTS_DIR/web}"
API_DIR="${API_DIR:-$PROJECTS_DIR/api}"
DOTFILES_DIR="/alp/dotfiles"
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

tmux new-session -d -s "$SESSION_NAME" -n web -c "$WEB_DIR" "$SHELL_BIN"
tmux new-window -t "$SESSION_NAME:" -n api -c "$API_DIR" "$SHELL_BIN"
tmux new-window -t "$SESSION_NAME:" -n db -c "$API_DIR" "$SHELL_BIN"
tmux new-window -t "$SESSION_NAME:" -n agy -c "$WEB_DIR" "$SHELL_BIN"
tmux new-window -t "$SESSION_NAME:" -n htop -c "$PROJECTS_DIR" "htop; exec $SHELL_BIN"
tmux new-window -t "$SESSION_NAME:" -n dot -c "$DOTFILES_DIR" "$SHELL_BIN"
tmux new-window -t "$SESSION_NAME:" -n run -c "$WEB_DIR" "$SHELL_BIN"
tmux new-window -t "$SESSION_NAME:" -n helper -c "$WEB_DIR" "$SHELL_BIN"

tmux select-window -t "$SESSION_NAME:web"
attach_or_switch
