export ZSH=/home/radix10/.oh-my-zsh
export TERM=xterm-256color
export EDITOR=nvim
export DISABLE_MAGIC_FUNCTIONS=true

ZSH_THEME=robbyrussell

plugins=(git tmux systemd)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey -v
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey '^f' autosuggest-accept

alias s='sudo '
alias r='proxychains -q '
alias v='nvim'
alias d='ydcv'
alias p='pacman'
alias t='trans'
alias x='xclip -rmlastnl -selection c'

unsetopt sharehistory

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
