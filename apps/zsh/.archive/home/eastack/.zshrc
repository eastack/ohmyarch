autoload -Uz compinit && compinit
setopt autocd
zstyle ':completion:*' menu select

alias .....='../../../../'
alias ....='../../../'
alias ...='../../'
alias ..='../'
alias cp='cp -r'
alias la='ls -la --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias mkdir='mkdir -p'
alias r='proxychains -q '
alias sc-restart='sudo systemctl restart'
alias sc-start='sudo systemctl start'
alias sc-status='sudo systemctl status'
alias scu-restart='sudo systemctl --user restart'
alias scu-start='sudo systemctl --user start'
alias scu-status='sudo systemctl --user status'
alias s='sudo '
alias tree='tree -C'
alias t='trans'
alias v='nvim'
alias x='xclip -rmlastnl -selection c'
alias gst='git status'
alias step='step-cli'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

bindkey -v
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey '^f' autosuggest-accept

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

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

function set_win_title(){
    echo -ne "\033]0; "$PWD" \007"
}
precmd_functions+=(set_win_title)
