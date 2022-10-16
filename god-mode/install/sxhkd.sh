#! /bin/sh

install () {
    mkdir -p $HOME/.config/sxhkd
    rsync -av --progress "$DIR/god-mode/dotconfig/sxhkd/" "$HOME/.config/sxhkd/"
}

read -r -p "Install sxhkd config [Y/n] " install_question
if [[ "$install_question" =~ ^([nN][oO]|[nN])$ ]]; then
    return 
fi
install
