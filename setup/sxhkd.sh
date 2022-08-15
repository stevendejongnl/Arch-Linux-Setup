#! /bin/sh

install () {
    mkdir -p $HOME/.config/sxhkd
    rsync -av --progress "$DIR/dotconfig/sxhkd/" "$HOME/.config/sxhkd/"
}

if [ -n "$INSTALL_ALL" ]; then
    install
else
    read -r -p "Install sxhkd config [y/N] " sxhkd_config
    if [[ "$sxhkd_config" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        install
    fi
fi
