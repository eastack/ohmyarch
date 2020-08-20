export ZSH="/home/radix10/.oh-my-zsh"
export TERM="xterm"

ZSH_THEME="robbyrussell"

plugins=(git tmux)

path=(~/.local/bin $path)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey -v
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey '^f' autosuggest-accept

alias s='sudo '
alias v='nvim'
alias p='pacman'
alias t='trans'
alias r='proxychains -q '
alias x='xclip -r -selection c'
alias startx='ssh-agent startx'

unsetopt sharehistory

monitor() {
  if [[ "$1" == "x" ]] {
    xrandr --output DP1 --mode 3840x2160 --output eDP1 --off
  } elif [[ "$1" == "e" ]] {
    xrandr --output eDP1 --mode 2560x1440 --output DP1 --off
  }
}

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
