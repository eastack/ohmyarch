path=(~/.local/bin $path)
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
