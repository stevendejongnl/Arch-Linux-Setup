#! /bin/sh

install () {
    mkdir -p $HOME/.config/polybar
    rsync -av --progress "$DIR/god-mode/dotconfig/polybar/" "$HOME/.config/polybar/"
}

if [ -n "$INSTALL_ALL" ]; then
    install
else
    read -r -p "Install polybar config [y/N] " install_question
    if [[ "$install_question" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        install
    fi
fi
