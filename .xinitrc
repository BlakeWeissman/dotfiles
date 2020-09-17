. ~/.xprofile

[[ -f ~/.cache/wal/colors.Xresources ]] && xrdb -merge -I$HOME ~/.cache/wal/colors.Xresources

exec i3

wal -R

