#! /bin/sh

install () {
    sudo rsync -av --progress "$DIR/etc/profile.d/" "/etc/profile.d/"
}

if [ -n "$INSTALL_ALL" ]; then
    install
else
    read -r -p "Install etc profile.d files [y/N] " install_question
    if [[ "$install_question" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        install
    fi
fi
