#! /bin/sh

read -r -p "Install dunst config [y/N] " dunst_config
if [[ "$dunst_config" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    mkdir -p $HOME/.config/dunst
    rsync -av --progress "$DIR/dotconfig/dunst/" "$HOME/.config/dunst/"
fi
