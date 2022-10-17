#! /bin/sh

install () {
    mkdir -p $HOME/.config/scripts
    rsync -av --progress "$DIR/god-mode/dotconfig/scripts/" "$HOME/.config/scripts/"

    ln -sf "$HOME/.config/scripts/notifications-clear" "$HOME/.local/bin/notifications-clear"
    ln -sf "$HOME/.config/scripts/notifications-open-all" "$HOME/.local/bin/notifications-open-all"
}

if [ $ALLYES ]; then
    install
    return
fi

read -r -p "Install scripts [Y/n] " install_question
if [[ "$install_question" =~ ^([nN][oO]|[nN])$ ]]; then
    return 
fi
install
