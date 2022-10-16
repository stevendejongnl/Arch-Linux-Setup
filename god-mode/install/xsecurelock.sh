#! /bin/sh

install () {
    mkdir -p $HOME/.config/xsecurelock
    rsync -av --progress "$DIR/god-mode/dotconfig/xsecurelock/" "$HOME/.config/xsecurelock/"
}

read -r -p "Install xsecurelock config [Y/n] " install_question
if [[ "$install_question" =~ ^([nN][oO]|[nN])$ ]]; then
    return 
fi
install
