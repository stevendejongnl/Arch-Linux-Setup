https://wiki.archlinux.org/title/installation_guide
https://www.youtube.com/watch?v=a8IJ-keZcq0&ab_channel=BrentWestbrook
https://www.debugpoint.com/gnome-arch-linux-install/

List disks
```bash
fdisk -l
```

Make changes in specific disk
```bash
fdisk /dev/vda
```

new partition boot:
```fdisk
n
+256M
```


new partition swap:
```fdisk
n
+2G
t
82
```

new partition root:
```fdisk
n
+25G
```

new partition home:
```fdisk
n
p
```

Write partitions:
```fdisk
w
```


format partitions:
```bash
mkfs.ext4 /dev/vda1
mkfs.ext4 /dev/vda3
mkfs.ext4 /dev/vda4
mkswap /dev/vda2
```


Mount partitions:
```bash
mount /dev/vda4 /mnt

mkdir /mnt/boot
mkdir /mnt/home

mount /dev/vda1 /mnt/boot
mount /dev/vda3 /mnt/home
```

Set swap:
```bash
swapon /dev/vda2
```

Install archlinux-keyring:
```bash
sudo pacman -Sy archlinux-keyring
```

Install packages to /mnt:
```bash
pacstrap /mnt base linux linux-firmware networkmanager dhcpcd git vim base-devel grub xorg xorg-xinit sddm bspwm sxhkd
```

Set fstab:
```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

Log into /mnt partition:
```bash
arch-chroot /mnt
```

Set locale:
```bash
vim /etc/locale.gen
# uncomment en_US.UTF-8 UTF-8

locale-gen

echo "LANG=en_US.UTF-8" >> /etc/locale.conf

ln –s /usr/share/zoneinfo/<Region>/<City> /etc/localtime

hwclock --systohc --utc
```

Set hostname:
```bash
echo "<hostname>" >> /etc/hostname
```

Enable dhcpcd:
```bash
systemctl enable dhcpcd
```

Setup grub
```bash
grub-install /dev/vda
grub-mkconfig -o /boot/grub/grub.cfg
```

Create user
```bash
useradd -m <username>
passwd <username>
usermod -aG wheel <username>
EDITOR=vim visudo
```

Uncomment wheel permission:
```bash
%wheel ALL=(ALL) ALL
```

Check user
```bash
sudo su - <username>
sudo whoami
```

Remove iso

Reboot
```bash
exit
reboot
```

NetworkManager
```bash
sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service
```

Set bspwm and sxhkd config:
```bash
git clone git@github.com:stevendejongnl/arch-linux-setup.git
install -Dm755 arch-linux-setup/bspwmrc ~/.config/bspwm/bspwmrc
install -Dm644 arch-linux-setup/sxhkdrc ~/.config/sxhkd/sxhkdrc
```

xinitrc
```bash
echo "exec bspwm" >> ~/.xinitrc
```

xserverrc
```bash
echo '#!/bin/sh

exec /usr/bin/Xorg -nolisten tcp "$@" vt$XDG_VTNR' > ~/.xserverrc
```

Install Applications:
```bash
sudo pacman -S
dmenu    # Application menu
kitty    # terminal
feh      # Wallpaper
chromium # Browser
gimp     # Image editor
nautilus # File manager
```

sddm
```bash
sudo systemctl enable sddm.service
sudo systemctl start sddm.service
```

Change fey wallpaper
```bash
feh --bg-fill ~/wallpapers/image.jpg
```

Install zsh
```bash
sudo pacman -S zsh
```

Install zplug
```bash
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
```

zshrc:
```bash
if [[ ! -d ~/.zplug ]];then
  git clone https://github.com/zplug/zplug ~/.zplug
fi
source ~/.zplug/init.zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "themes/robbyrussell", from:oh-my-zsh, as:theme
zplug "wfxr/forgit"
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
#zplug load --verbose
zplug load
```