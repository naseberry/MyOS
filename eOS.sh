#! /bin/bash


# Download Elementary OS from here:
# http://elementary.io/


# Update system
sudo apt update && sudo apt upgrade -y


# Enable PPA
echo "Installing software-properties-common @ $(date)"
sudo apt install software-properties-common -y


# Add Repository
repositories=(
  ppa:git-core/ppa
  ppa:philip.scott/elementary-tweaks
)

for repository in ${repositories[@]}; do
  echo "Adding $repository @ $(date)"
  sudo add-apt-repository $repository -y
done


# Update system
sudo apt update


# Install Apps
apps=(
  gdebi
  elementary-tweaks
  firefox
)

for app in ${apps[@]}; do
  echo "Installing $app @ $(date)"
  sudo apt install $app -y
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
