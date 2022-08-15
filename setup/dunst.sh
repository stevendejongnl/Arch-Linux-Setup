#! /bin/sh

install () {
    mkdir -p $HOME/.config/dunst
    rsync -av --progress "$DIR/dotconfig/dunst/" "$HOME/.config/dunst/"
}

if [ ! -z "$INSTALL_ALL" ]; then
    install
else
    read -r -p "Install dunst config [y/N] " dunst_config
    if [[ "$dunst_config" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        install
    fi
fi
