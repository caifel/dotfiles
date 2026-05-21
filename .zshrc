# Linux workstation shell config for the Docker dev container.

export LANG="C.UTF-8"
export LC_ALL="C.UTF-8"

export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="nvim"
export VISUAL="nvim"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$HOME/.local/bin:$HOME/bin:$PATH"

alias vim="nvim"
alias vi="nvim"
alias ll="ls -la"
alias ws="~/.config/tmux/dev-session.sh"
alias db="sqlite3"
alias dc="docker compose"

autoload -Uz vcs_info
zstyle ":vcs_info:git:*" formats " %F{8}(%b)%f"
zstyle ":vcs_info:git:*" actionformats " %F{8}(%b|%a)%f"
precmd() { vcs_info }
setopt prompt_subst
PROMPT="%F{6}mario@ws%f %F{4}%~%f\${vcs_info_msg_0_} %# "

kill_port() {
  if [ -z "${1:-}" ]; then
    echo "usage: kill_port <port>"
    return 1
  fi

  if ! command -v lsof >/dev/null 2>&1; then
    echo "lsof is not installed in this container"
    return 1
  fi

  lsof -ti:"$1" | xargs -r kill
}

[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"


# Added by Antigravity CLI installer
export PATH="/home/mario/.local/bin:$PATH"
