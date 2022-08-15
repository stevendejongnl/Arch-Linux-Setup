#! /bin/sh

read -r -p "Install bswpm config [y/N] " bspwm_config
if [[ "$bspwm_config" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    mkdir -p $HOME/.config/bspwm
    rsync -av --progress "$DIR/dotconfig/bspwm/" "$HOME/.config/bspwm/"
    chmod +x "$HOME/.config/bspwm/bspwmrc"
    chmod +x "$HOME/.config/bspwm/monitor-setup.sh"
    chmod +x "$HOME/.config/bspwm/rules.sh"
    chmod +x "$HOME/.config/bspwm/styling.sh"
fi
