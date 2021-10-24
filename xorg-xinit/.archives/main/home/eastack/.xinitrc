# Load .Xresources
xrdb -merge ~/.Xresources

# Source xinitrc.d
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Export SSH_AUTH_SOCK
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

# Start i3
exec i3
