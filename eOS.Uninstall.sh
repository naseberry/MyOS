#! /bin/bash


# Download Elementary OS from here:
# http://elementary.io/


# Update system
sudo apt update && sudo apt upgrade -y


# Uninstall apps
apps=(
  audience # video player
  epiphany-browser # web browser
  evolution-data-server
  maya-calendar # calendar
  noise # audio player
  pantheon-calculator # calculator
  pantheon-mail # mail client
  pantheon-photos # photos
  snap-photobooth # camera
  scratch-text-editor # text editor
  screenshot-tool # screenshot
  simple-scan # scanner
)

for app in ${apps[@]}; do
  read -p "Do you want to remove $app [Y/n] "
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo apt purge $app -y
  elif [[ $REPLY =~ ^[Nn]$ ]]; then
    echo ">> $app not uninstalled"
  else
    echo "Aborted."
  fi
done


# Clean system
clean=(
  autoremove
  autoclean
)

for cmd in ${clean[@]}; do
  echo "Running: $cmd @ $(date)"
  sudo apt $cmd -y
done
