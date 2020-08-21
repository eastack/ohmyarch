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

# Start i3
exec i3
