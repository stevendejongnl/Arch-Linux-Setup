#! /bin/sh

install () {
    # sudo rsync -av --progress "$DIR/etc/profile.d/" "/etc/profile.d/"
    sudo rsync -av --progress "$DIR/god-mode/etc/pacman.d/" "/etc/pacman.d/"
}

read -r -p "Install etc files [Y/n] " install_question
if [[ "$install_question" =~ ^([nN][oO]|[nN])$ ]]; then
    return 
fi
install
