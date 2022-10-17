#! /bin/sh

install () {
    mkdir -p $HOME/.config/dunst
    rsync -av --progress "$DIR/god-mode/dotconfig/dunst/" "$HOME/.config/dunst/"
}

if [ $ALLYES ]; then
    install
    return
fi

read -r -p "Install dunst config [Y/n] " install_question
if [[ "$install_question" =~ ^([nN][oO]|[nN])$ ]]; then
    return 
fi
install
