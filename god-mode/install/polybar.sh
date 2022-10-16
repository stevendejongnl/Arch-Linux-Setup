#! /bin/sh

install () {
    mkdir -p $HOME/.config/polybar
    rsync -av --progress "$DIR/god-mode/dotconfig/polybar/" "$HOME/.config/polybar/"
}

read -r -p "Install polybar config [Y/n] " install_question
if [[ "$install_question" =~ ^([nN][oO]|[nN])$ ]]; then
    return 
fi
install
