#! /bin/sh

DIR="$(dirname "${BASH_SOURCE[0]}")"
DIR="$(realpath "${DIR}")"

source "$DIR/setup/rsync.sh"

source "$DIR/setup/bspwm.sh"
source "$DIR/setup/sxhkd.sh"
source "$DIR/setup/kitty.sh"
