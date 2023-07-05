#! /bin/bash


####################
# Update system
####################

sudo apt update && sudo apt -y upgrade --with-new-pkgs


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
  ppa:philip.scott/pantheon-tweaks
  ppa:team-xbmc/ppa
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
  curl
  dconf-editor
  gdebi
  git
  gnome-disk-utility
  gnome-system-monitor
  gnupg2
  gparted
  kodi
  net-tools
  pantheon-tweaks
  seahorse
  tlp
  vlc
)

for app in ${install[@]}; do
  echo ">> Installing $app <<"
  sudo apt install -y $app
done


####################
# Brave
####################

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install -y brave-browser


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
