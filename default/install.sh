source "$DIR/setup/rsync.sh"

# Install packages
sudo pacman -S \
    vim \
    git \
    base-devel \
    xorg xorg-xinit \
    bspwm sxhkd \
    polybar rofi \
    dunst \
    xss-lock xsecurelock \
    zsh \
    kitty \
    direnv \
    breeze adwaita-icon-theme papirus-icon-theme \
    noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra

# Download and install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si


cd $DIR

# Install yay packages
yay -S \
    google-chrome \
    ntfd-bin \
    nordic-theme

# Copy default zprofile
rsync -av --progress "$DIR/dotfiles/zprofile" "$HOME/.zprofile"

# Copy X11 config
mkdir -p $HOME/.config/X11
rsync -av --progress "$DIR/dotconfig/X11/" "$HOME/.config/X11/"

# Install default bspwm and sxhkd config
install -Dm755 ./default/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
install -Dm644 ./default/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc

# Install zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# copy default zshrc
rsync -av --progress "$DIR/default/zsh/zshrc" "$HOME/.zshrc"

# Change Shell to zsh
USER=${USER:-$(id -u -n)}
sudo -k chsh -s "zsh" "$USER"
export SHELL="zsh"
