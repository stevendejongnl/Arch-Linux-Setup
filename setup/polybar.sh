#! /bin/sh

install () {
    mkdir -p $HOME/.config/polybar
    rsync -av --progress "$DIR/dotconfig/polybar/" "$HOME/.config/polybar/"
}

if [ ! -z "$INSTALL_ALL" ]; then
    install
else
    read -r -p "Install polybar config [y/N] " polybar_config
    if [[ "$polybar_config" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        install
    fi
fi
