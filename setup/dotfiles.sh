#! /bin/sh

install () {
    rsync -av --progress "$DIR/dotxinitrc" "$HOME/.xinitrc"
    rsync -av --progress "$DIR/dotxresources" "$HOME/.Xresources"
}

if [ -n "$INSTALL_ALL" ]; then
    install
else
    read -r -p "Install dot files [y/N] " dotfiles
    if [[ "$dotfiles" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        install
    fi
fi
