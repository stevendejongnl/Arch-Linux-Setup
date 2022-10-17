#! /bin/sh

install () {
    mkdir -p $HOME/.config/autorandr
    rsync -av --progress "$DIR/god-mode/dotconfig/autorandr/" "$HOME/.config/autorandr/"
}

if [ $ALLYES ]; then
    install
    return
fi

read -r -p "Install autorandr config [Y/n] " install_question
if [[ "$install_question" =~ ^([nN][oO]|[nN])$ ]]; then
    return 
fi
install 
