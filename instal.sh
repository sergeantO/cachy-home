# install yay
sudo pacman -S --needed git base-devel
cd $(mktemp -d)
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# For full automation in script
yay --save --answerclean All --answerdiff All

# copy-paste fix
sudo pacman -S clipman
yay -S wl-clipboard-x11

# setup terminal
sudo pacman -S kitty
cd $(mktemp -d)
THEME=https://raw.githubusercontent.com/dexpota/kitty-themes/master/themes/Monokai_Classic.conf
wget "$THEME" -P ~/.config/kitty/kitty-themes/themes
cd ~/.config/kitty
cp ./kitty-themes/themes/Monokai_Classic.conf ~/.config/kitty/theme.conf
## include ./theme.conf

# change shall
sudo pacman -S fish
cd $(mktemp -d)
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
sudo chhs -s $(which fish)
fisher install IlanCosman/tide@v6
tide configure

# Jura fort
cp ./fonts/Jura usr/share/fonts

# neovim
sudo pacman -S --noconfirm --needed gcc make git ripgrep fd unzip neovim

# base desktop env
sudo pacman -S hyprshot mng-look thunar gdm

# Compiling wlogout from Source
sudo pacman -S meson
cd $(mktemp -d)
git clone https://github.com/ArtsyMacaw/wlogout.git
cd wlogout
meson build
ninja -C build
sudo ninja -C build install

# gtk-theme
cd $(mktemp -d)
git clone https://github.com/vinceliuice/Graphite-gtk-theme.git
bash Graphite-gtk-theme/install.sh
mng-look

# media
sudo pacman -S ffmpeg
sudo pacman -S vlc vlc-plugin-ffmpeg

# torrent
sudo pacman -S transmission-gtk
xdg-mime default thunar.desktop inode/directory

# vscode
sudo pacman -S code

# Docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo pacman -S docker docker-buildx docker-compose
docker run hello-world

# dev env
sudo pacman -S jdk21-openjdk
sudo pacman -S kotlin
sudo pacman -S nodejs
sudo pacman -S go
sudo pacman -S rust

# Insomnia REST Client Arch installer
cd $(mktemp -d)
wget https://aur.archlinux.org/cgit/aur.git/snapshot/insomnia.tar.gz
tar xzf insomnia.tar.gz
cd insomnia
makepkg -s
sudo pacman -U insomnia-*-x86_64.pkg.tar

# other
sudo pacman -S fastfetch cmatrix telegram-desktop

# install steam
sudo pacman -S flatpak
flatpak --user remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak --user install flathub com.valvesoftware.Steam
flatpak run com.valvesoftware.Steam

# install hearthstone
sudo pacman -S base-devel crypto++ webkit2gtk git curl python python-virtualenv
git clone --recursive https://github.com/0xf4b1/hearthstone-linux.git && cd hearthstone-linux
bash hearthstone-linux/craft.sh
bash hearthstone/login
