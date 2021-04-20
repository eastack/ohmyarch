autoload -Uz compinit && compinit
setopt autocd
zstyle ':completion:*' menu select

export HISTFILE=~/.histfile
export HISTSIZE=1000
export SAVEHIST=1000
export TERM=xterm-256color
export EDITOR=nvim
export GPG_TTY=$(tty)

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey -v
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey '^f' autosuggest-accept

alias .....='../../../../'
alias ....='../../../'
alias ...='../../'
alias ..='../'
alias cp='cp -r'
alias l='ls --color=auto'
alias ll='ls -l --color=auto'
alias r='proxychains -q '
alias s='sudo '
alias sc-restart='sudo systemctl restart'
alias sc-start='sudo systemctl start'
alias sc-status='sudo systemctl status'
alias scu-restart='sudo systemctl --user restart'
alias scu-start='sudo systemctl --user start'
alias scu-status='sudo systemctl --user status'
alias t='trans'
alias v='nvim'
alias x='xclip -rmlastnl -selection c'

wifi-switch() {
  iwctl station wlan0 scan
  sleep 5
  interface=$(iwctl station list | grep connected | cut -d ' ' -f 3)
  iwctl station $interface disconnect
  iwctl station $interface connect $1
}

reconnect-touchpad() {
  echo -n "none" | sudo tee /sys/bus/serio/devices/serio1/drvctl
  echo -n "reconnect" | sudo tee /sys/bus/serio/devices/serio1/drvctl
}

gpg-connect-agent updatestartuptty /bye >/dev/null

eval "$(starship init zsh)"
