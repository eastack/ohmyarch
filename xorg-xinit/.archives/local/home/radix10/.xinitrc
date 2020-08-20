# load .Xresources
xrdb -merge ~/.Xresources

# start fcitx
export XMODIFIERS="@im=fcitx"
export GTK_IM_MODULE="fcitx"
fcitx-autostart

# Make GDK 3 support hidpi
# To scale UI elements by an integer factor
export GDK_SCALE=2
# To undo scaling of text, fractional scale
export GDK_DPI_SCALE=0.5

# set wallpaper
~/.fehbg

# key mapping
~/.keymapping

# auto lock
xss-lock -- i3lock -u -i ~/pictures/wallpaper.png &

# start gost
gost -C ~/.config/gost/config.json &

# start i3
exec i3
