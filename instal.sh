# install yay
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# copy-paste fix
sudo pacman -S clipman
yay -S wl-clipboard-x11

# change shall
sudo chhs /bin/zsh

sudo pacman -S kitty hyprshot
sudo pacman -S mng-look thunar code 

git clone https://github.com/vinceliuice/Graphite-gtk-theme.git
bash Graphite-gtk-theme/install.sh
mng-look

# Compiling wlogout from Source
sudo pacman -S meson
git clone https://github.com/ArtsyMacaw/wlogout.git
cd wlogout
meson build
ninja -C build
sudo ninja -C build install

# Display managers 
sudo pacman -S gdm

# Docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo pacman -S docker docker-buildx docker-compose
docker run hello-world

# other
sudo pacman -S fastfetch cmatrix telegram-desktop nodejs 
sudo pacman -S hyprshot

# media
sudo pacman -S vlc vlc-plugin-ffmpeg 

# torrent
sudo pacman -S transmission-gtk
xdg-mime default thunar.desktop inode/directory

# install steam
sudo pacman -S flatpak
flatpak --user remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak --user install flathub com.valvesoftware.Steam

# run
flatpak run com.valvesoftware.Steam

# install hearthstone
sudo pacman -S base-devel crypto++ webkit2gtk git curl python python-virtualenv
git clone --recursive https://github.com/0xf4b1/hearthstone-linux.git && cd hearthstone-linux
bash hearthstone-linux/craft.sh
cd hearthstone
bash ./login