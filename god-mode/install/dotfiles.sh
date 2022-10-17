#! /bin/sh

install () {
    rsync -av --progress "$DIR/god-mode/dotfiles/zprofile" "$HOME/.zprofile"
    rsync -av --progress "$DIR/god-mode/dotfiles/zshrc" "$HOME/.zshrc"
}

if [ $ALLYES ]; then
    install
    return
fi

read -r -p "Install dotfiles config [Y/n] " install_question
if [[ "$install_question" =~ ^([nN][oO]|[nN])$ ]]; then
    return 
fi
install
