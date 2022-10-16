#! /bin/sh

install () {
    mkdir -p $HOME/.config/dunst
    rsync -av --progress "$DIR/god-mode/dotconfig/dunst/" "$HOME/.config/dunst/"
}

read -r -p "Install dunst config [Y/n] " install_question
if [[ "$install_question" =~ ^([nN][oO]|[nN])$ ]]; then
    return 
fi
install
