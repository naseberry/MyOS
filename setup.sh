#! /bin/bash


####################
# Update system
####################
sudo apt update && sudo apt -y upgrade


####################
# Enable PPA
####################
echo ">> Installing software-properties-common <<"
sudo apt install -y software-properties-common


####################
# Add PPA
####################
ppas=(
  ppa:chromium-team/stable
  ppa:danielrichter2007/grub-customizer
  ppa:git-core/ppa
  ppa:philip.scott/elementary-tweaks
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
  # appeditor
  # bravebrowser
  chromium-browser
  # eddy
  elementary-tweaks
  firefox
  gdebi
  git
  gnome-disk-utility
  gnome-system-monitor
  gnupg2
  gparted
  grub-customizer
  # keeweb
  # lamp-server^
  # postman
  seahorse
  # slack
  # spotify
  # visualstudiocode
  vlc
  # zoom
)

for app in ${install[@]}; do
  echo ">> Installing $app <<"
  sudo apt install -y $app
done


####################
# Uninstall default apps
####################
# uninstall=(
#   audience # video player
#   epiphany-browser # web browser
#   evolution-data-server
#   maya-calendar # calendar
#   noise # audio player
#   pantheon-mail # mail client
#   simple-scan # scanner
# )

# for app in ${uninstall[@]}; do
#   echo ">> Uninstall $app <<"
#   sudo apt purge -y $app
# done


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
