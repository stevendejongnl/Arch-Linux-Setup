#! /bin/sh

install () {
    mkdir -p $HOME/.config/rofi
    rsync -av --progress "$DIR/dotconfig/rofi/" "$HOME/.config/rofi/"
}

if [ -n "$INSTALL_ALL" ]; then
    install
else
    read -r -p "Install rofi config [y/N] " install_question
    if [[ "$install_question" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        install
    fi
fi
