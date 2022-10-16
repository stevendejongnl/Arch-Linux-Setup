#! /bin/sh

install () {
    mkdir -p $HOME/.config/sxhkd
    rsync -av --progress "$DIR/god-mode/dotconfig/sxhkd/" "$HOME/.config/sxhkd/"
}

if [ -n "$INSTALL_ALL" ]; then
    install
else
    read -r -p "Install sxhkd config [y/N] " install_question
    if [[ "$install_question" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        install
    fi
fi
