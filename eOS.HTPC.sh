#! /bin/bash


# Download Elementary OS from here:
# http://elementary.io/


# Update system
sudo apt update && sudo apt upgrade -y


#Install Kodi
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:team-xbmc/ppa -y
sudo apt update
sudo apt install kodi -y


# VLC
sudo apt install vlc -y
