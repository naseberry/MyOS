#! /bin/bash


####################
# Update system
####################

sudo apt update
sudo apt -y upgrade --with-new-pkgs


####################
# Enable PPA
####################

echo ">> Installing software-properties-common <<"
sudo apt install -y software-properties-common


####################
# Add PPA
####################

ppas=(
  ppa:git-core/ppa
)

for ppa in ${ppas[@]}; do
  echo ">> Adding repository: $ppa <<"
  sudo add-apt-repository -y $ppa
done


####################
# Update system
####################

sudo apt update


####################
# Install Apps
####################

install=(
  baobab
  btop
  curl
  dconf-editor
  gdebi
  git
  gnome-disk-utility
  gnome-logs
  gnome-power-manager
  gnome-system-monitor
  gnupg2
  gparted
  net-tools
  psensor
  seahorse
  tlp
  tlp-rdw
  vlc
)

for app in ${install[@]}; do
  echo ">> Installing $app <<"
  sudo apt install -y $app
done


####################
# Brave
####################

curl -fsS https://dl.brave.com/install.sh | sh


####################
# Chrome
####################

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
gio trash google-chrome-stable_current_amd64.deb


####################
# Power management
####################

sudo systemctl enable tlp.service


####################
# VPN
####################

sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)


####################
# VSCode
####################

wget -O vscode-latest.deb https://update.code.visualstudio.com/latest/linux-deb-x64/stable
sudo dpkg -i vscode-latest.deb
sudo apt-get install -f
gio trash vscode-latest.deb


####################
# Clean system
####################

clean=(
  autoremove
  autoclean
)

for cmd in ${clean[@]}; do
  echo ">> Running: $cmd <<"
  sudo apt -y $cmd
done


####################
# Restart system
####################

sudo reboot
