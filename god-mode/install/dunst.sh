#! /bin/sh

install () {
    mkdir -p $HOME/.config/dunst
    rsync -av --progress "$DIR/dotconfig/dunst/" "$HOME/.config/dunst/"
}

if [ -n "$INSTALL_ALL" ]; then
    install
else
    read -r -p "Install dunst config [y/N] " install_question
    if [[ "$install_question" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        install
    fi
fi
