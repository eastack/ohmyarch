# Load .Xresources
xrdb -merge ~/.Xresources

# Set fcitx environment variable
export XMODIFIERS="@im=fcitx"
export GTK_IM_MODULE="fcitx"

# Make GDK 3 support hidpi
# To scale UI elements by an integer factor
export GDK_SCALE=2
# To undo scaling of text, fractional scale
export GDK_DPI_SCALE=0.5

# Update D-Bus session services environment
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY

#Start gnome keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Start i3
exec i3
