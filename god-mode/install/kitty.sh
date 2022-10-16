#! /bin/sh

install () {
    mkdir -p $HOME/.config/kitty
    rsync -av --progress "$DIR/god-mode/dotconfig/kitty/" "$HOME/.config/kitty/"
}

if [ -n "$INSTALL_ALL" ]; then
    install
else
    read -r -p "Install kitty config [y/N] " install_question
    if [[ "$install_question" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        install
    fi
fi
