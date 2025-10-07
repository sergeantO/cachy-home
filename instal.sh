# install yay
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# copy-paste fix
sudo pacman -S clipman
yay -S wl-clipboard-x11

# change shall
cd $(mktemp -d)
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
sudo chhs /bin/zsh

# base desktop env
sudo pacman -S kitty hyprshot mng-look thunar gdm

# gtk-theme
git clone https://github.com/vinceliuice/Graphite-gtk-theme.git
bash Graphite-gtk-theme/install.sh
mng-look

# torrent
sudo pacman -S transmission-gtk
xdg-mime default thunar.desktop inode/directory

# Compiling wlogout from Source
sudo pacman -S meson
git clone https://github.com/ArtsyMacaw/wlogout.git
cd wlogout
meson build
ninja -C build
sudo ninja -C build install

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

# other
sudo pacman -S fastfetch cmatrix telegram-desktop

# media
sudo pacman -S vlc vlc-plugin-ffmpeg

# Insomnia REST Client Arch installer
cd $(mktemp -d)
wget https://aur.archlinux.org/cgit/aur.git/snapshot/insomnia.tar.gz
tar xzf insomnia.tar.gz
cd insomnia
makepkg -s
sudo pacman -U insomnia-*-x86_64.pkg.tar

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
