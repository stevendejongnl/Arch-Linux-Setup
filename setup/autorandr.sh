#! /bin/sh

install () {
    mkdir -p $HOME/.config/autorandr
    rsync -av --progress "$DIR/dotconfig/autorandr/" "$HOME/.config/autorandr/"
}

if [ ! -z "$INSTALL_ALL" ]; then
    install
else
    read -r -p "Install autorandr config [y/N] " autorandr_config
    if [[ "$autorandr_config" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        install
    fi
fi
