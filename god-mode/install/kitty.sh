#! /bin/sh

install () {
    mkdir -p $HOME/.config/kitty
    rsync -av --progress "$DIR/god-mode/dotconfig/kitty/" "$HOME/.config/kitty/"
}

if [ $ALLYES ]; then
    install
    return
fi

read -r -p "Install kitty config [Y/n] " install_question
if [[ "$install_question" =~ ^([nN][oO]|[nN])$ ]]; then
    return 
fi
install
