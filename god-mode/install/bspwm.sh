#! /bin/sh

install () {
    mkdir -p $HOME/.config/bspwm
    rsync -av --progress "$DIR/god-mode/dotconfig/bspwm/" "$HOME/.config/bspwm/"
    chmod +x "$HOME/.config/bspwm/bspwmrc"
    chmod +x "$HOME/.config/bspwm/monitor-setup.sh"
    chmod +x "$HOME/.config/bspwm/rules.sh"
    chmod +x "$HOME/.config/bspwm/styling.sh"
}

if [ -n "$INSTALL_ALL" ]; then
    install
else
    read -r -p "Install bswpm config [y/N] " install_question
    if [[ "$install_question" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        install
    fi
fi
