#!/bin/bash
source utils.sh

# Homebrew
echo -e "\n"
echoGreen "============== Installing Homebrew and Cask =============="
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

echo -e "\n"
echoGreen "============== Tapping Brew Caskroom/fonts =============="
brew tap caskroom/fonts

echo -e "\n"
echoGreen "============== Installing Brew Casks =============="
while read app
do
    echoGreen "Installing ${app}"
    brew cask install "$app"
done <data/cask_apps

echo -e "\n"
echoGreen "============== Installing Brew apps =============="
while read app
do
    echo "Installing ${app}"
    brew install "$app"
done <data/brew_apps

echo -e "\n"
echoGreen "============== Installing NVM =============="
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
source ~/.bash_profile

echo -e "\n"
echoGreen "============== Installing Node =============="
nvm install stable
nvm use stable

echo -e "\n"
echoGreen "============== Install node global tools =============="
npm install -g npm
npm install -g eslint

echo -e "\n"
echoGreen "==============  Install Python tools =============="
mkdir ~/.virtualenvs
pip3 install virtualenvwrapper
pip3 install pylint

echo -e "\n"
echoGreen "==============  Install Jekyll =============="
gem install jekyll bundler
