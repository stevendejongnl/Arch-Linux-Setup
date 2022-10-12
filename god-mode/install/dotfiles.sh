#! /bin/sh

install () {
    rsync -av --progress "$DIR/dotfiles/zprofile" "$HOME/.zprofile"
    rsync -av --progress "$DIR/dotfiles/zshrc/" "$HOME/.zshrc"
}

if [ -n "$INSTALL_ALL" ]; then
    install
else
    read -r -p "Install kitty config [y/N] " install_question
    if [[ "$install_question" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        install
    fi
fi
