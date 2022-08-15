#! /bin/sh

install () {
    mkdir -p $HOME/.config/kitty
    rsync -av --progress "$DIR/dotconfig/kitty/" "$HOME/.config/kitty/"
}

if [ -n "$INSTALL_ALL" ]; then
    install
else
    read -r -p "Install kitty config [y/N] " kitty_config
    if [[ "$kitty_config" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        install
    fi
fi
