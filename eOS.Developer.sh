#! /bin/bash


# Download Elementary OS from here:
# http://elementary.io/


# Update system
sudo apt update && sudo apt upgrade -y


# Add Repository
repositories=(
  ppa:git-core/ppa
)

for repository in ${repositories[@]}; do
  echo "Adding $repository @ $(date)"
  sudo add-apt-repository $repository -y
done


# Update system
sudo apt update


# Install Apps
apps=(
  ubuntu-make
  chromium-browser
  git
  # lamp-server^
)

for app in ${apps[@]}; do
  echo "Installing $app @ $(date)"
  sudo apt install $app -y
done

## Umake
### Using Visual studio code as my default editor
echo "Installing visual-studio-code @ $(date)"
umake ide visual-studio-code
### Create alias to run and update vscode
echo "# EDITOR / IDE" >> $HOME/.bash_aliases
echo "alias code='$HOME/.local/share/umake/ide/visual-studio-code/bin/code -n'" >> $HOME/.bash_aliases
echo "alias codeu='umake ide visual-studio-code'" >> $HOME/.bash_aliases


# NVM
echo "Installing NodeJS LTS @ $(date)"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
nvm install --lts


# RVM
echo "Installing RVM @ $(date)"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
# In rare cases the gpg --keyserver fails, use this instead:
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
\curl -sSL https://get.rvm.io | bash -s stable
source $HOME/.rvm/scripts/rvm
rvm install 2.4.1
# Install ruby documentation
# rvm docs generate-ri
# rvm use 2.4.1 --default
gem install bundler
gem install rails -v 5.1.4


# Clean system
clean=(
  autoremove
  autoclean
)

for cmd in ${clean[@]}; do
  echo "Running: $cmd @ $(date)"
  sudo apt $cmd -y
done


# Source files
## Fix to $HOME/.bash_profile not loading
echo ". $HOME/.bash_profile" >> $HOME/.bashrc
. $HOME/.bashrc
