# Linux workstation shell config for the Docker dev container.

export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="nvim"
export VISUAL="nvim"

export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$HOME/.local/bin:$HOME/bin:$PNPM_HOME:$PATH"

alias vim="nvim"
alias vi="nvim"
alias ll="ls -la"

autoload -Uz vcs_info
zstyle ":vcs_info:git:*" formats " %F{8}(%b)%f"
zstyle ":vcs_info:git:*" actionformats " %F{8}(%b|%a)%f"
precmd() { vcs_info }
setopt prompt_subst
PROMPT="%F{6}mario@workstation%f %F{4}%~%f\${vcs_info_msg_0_} %# "

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
