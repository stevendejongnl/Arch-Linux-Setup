#! /bin/sh

install () {
    mkdir -p $HOME/.config/X11
    rsync -av --progress "$DIR/default/X11/" "$HOME/.config/X11/"
}

read -r -p "Install X11 config [Y/n] " install_question
if [[ "$install_question" =~ ^([nN][oO]|[nN])$ ]]; then
    return 
fi
install
