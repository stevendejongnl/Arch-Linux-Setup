#! /bin/sh

if ! command -v rsync &> /dev/null; then
    echo "rsync could not be found"
    read -r -p "Install rsync for copying files [y/N] " install_question
    if [[ "$install_question" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        sudo pacman -S rsync
    else
        exit
    fi
fi
