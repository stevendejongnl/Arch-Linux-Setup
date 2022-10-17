#! /bin/sh

install () {
    mkdir -p $HOME/.config/rofi
    rsync -av --progress "$DIR/god-mode/dotconfig/rofi/" "$HOME/.config/rofi/"
}

if [ $ALLYES ]; then
    install
    return
fi

read -r -p "Install rofi config [Y/n] " install_question
if [[ "$install_question" =~ ^([nN][oO]|[nN])$ ]]; then
    return 
fi
install
