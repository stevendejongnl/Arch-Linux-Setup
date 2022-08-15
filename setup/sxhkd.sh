#! /bin/sh

read -r -p "Install sxhkd config [y/N] " sxhkd_config
if [[ "$sxhkd_config" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    mkdir -p $HOME/.config/sxhkd
    rsync -av --progress "$DIR/dotconfig/sxhkd/" "$HOME/.config/sxhkd/"
fi
