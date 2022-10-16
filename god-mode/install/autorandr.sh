#! /bin/sh

install () {
    mkdir -p $HOME/.config/autorandr
    rsync -av --progress "$DIR/god-mode/dotconfig/autorandr/" "$HOME/.config/autorandr/"
}

if [ -n "$INSTALL_ALL" ]; then
    install
else
    read -r -p "Install autorandr config [y/N] " install_question
    if [[ "$install_question" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        install
    fi
fi
