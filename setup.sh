#! /bin/sh

DIR="$(dirname "${BASH_SOURCE[0]}")"
DIR="$(realpath "${DIR}")"

POSITIONAL_ARGS=()

help () {
    echo "HELLP!"
}

while [[ $# -gt 0 ]]; do
    case $1 in
        -a|--all)
            INSTALL_ALL="$1"
            shift # past argument
            ;;
        -d|--default)
            DEFAULT="$1"
            shift # past argument
            ;;
        -h|--help)
            help
            exit 1
            ;;
        -*|--*)
            echo "Unknown option $1"
            exit 1
            ;;
        *)
            POSITIONAL_ARGS+=("$1") # save positional arg
            shift # past argument
            ;;
    esac
done

source "$DIR/setup/rsync.sh"

if [ -n "$DEFAULT" ]; then
    pacman -S git base-devel polybar rofi kitty breeze adwaita-icon-theme papirus-icon-theme dunst xss-lock xsecurelock

    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si

    cd $DIR

    yay -S ntfd-bin nordic-theme

    rsync -av --progress "$DIR/dotfiles/zprofile/" "$HOME/.zprofile"

    mkdir -p $HOME/.config/X11
    rsync -av --progress "$DIR/dotconfig/X11/" "$HOME/.config/X11/"

    install -Dm755 ./default/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
    install -Dm644 ./default/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
else
    source "$DIR/setup/etc.sh"
    source "$DIR/setup/dotfiles.sh"
    source "$DIR/setup/X11.sh"
    source "$DIR/setup/bspwm.sh"
    source "$DIR/setup/sxhkd.sh"
    source "$DIR/setup/polybar.sh"
    source "$DIR/setup/rofi.sh"
    source "$DIR/setup/kitty.sh"
    source "$DIR/setup/autorandr.sh"
    source "$DIR/setup/dunst.sh"
    source "$DIR/setup/xsecurelock.sh"
    source "$DIR/setup/scripts.sh"
fi
