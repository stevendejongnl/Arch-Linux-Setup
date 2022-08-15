#! /bin/sh

DIR="$(dirname "${BASH_SOURCE[0]}")"
DIR="$(realpath "${DIR}")"

while getopts ":a:" opt; do
    case $opt in
        a) INSTALL_ALL="$OPTARG"
        ;;
        \?) echo "Invalid option -$OPTARG" >&2
        exit 1
        ;;
    esac

#   case $OPTARG in
#     -*) echo "Option $opt needs a valid argument"
#     exit 1
#     ;;
#   esac
done

source "$DIR/setup/rsync.sh"

source "$DIR/setup/bspwm.sh"
source "$DIR/setup/sxhkd.sh"
source "$DIR/setup/polybar.sh"
source "$DIR/setup/kitty.sh"
source "$DIR/setup/autorandr.sh"
source "$DIR/setup/dunst.sh"