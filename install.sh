#! /bin/sh

DIR="$(dirname "${BASH_SOURCE[0]}")"
DIR="$(realpath "${DIR}")"

POSITIONAL_ARGS=()

help () {
    echo "
    Usage:
    --default [-d]
    --god-mode [-gm]

    Default:
        Install a default configuration for bspwm with sxhkd and xsecurelock.
        Also adds a zsh config.
    
    God mode:
        Install's my personal configuration, this is not guaranteed to work.
        I continuously adjust this configuration, and don't test it often to be able to use it on other systems.
    "
}

while [[ $# -gt 0 ]]; do
    case $1 in
        -d|--default)
            DEFAULT="$1"
            shift
            ;;
        -gm|--god-mode)
            GODMODE="$1"
            shift
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
            POSITIONAL_ARGS+=("$1")
            shift
            ;;
    esac
done

if [ -n "$DEFAULT" ]; then
    read -r -p "Are you sure you want to install a default configuration? [y/N] " install_question
    if [[ "$install_question" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        source "$DIR/default/install.sh"
    fi
elif [ -n "$GODMODE" ]; then
    read -r -p "Are you sure you want to install the god mode configuration? [y/N] " install_question
    if [[ "$install_question" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        source "$DIR/god-mode/install.sh"
    fi
else
    help
fi
