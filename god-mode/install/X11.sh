#! /bin/sh

install () {
    mkdir -p $HOME/.config/X11
    rsync -av --progress "$DIR/god-mode/dotconfig/X11/" "$HOME/.config/X11/"
}

if [ -n "$INSTALL_ALL" ]; then
    install
else
    read -r -p "Install X11 config [y/N] " install_question
    if [[ "$install_question" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        install
    fi
fi
