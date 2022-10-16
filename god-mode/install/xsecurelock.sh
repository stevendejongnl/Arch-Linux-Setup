#! /bin/sh

install () {
    mkdir -p $HOME/.config/xsecurelock
    rsync -av --progress "$DIR/god-mode/dotconfig/xsecurelock/" "$HOME/.config/xsecurelock/"
}

if [ -n "$INSTALL_ALL" ]; then
    install
else
    read -r -p "Install xsecurelock config [y/N] " install_question
    if [[ "$install_question" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        install
    fi
fi
