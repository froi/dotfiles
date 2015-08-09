#!/bin/bash

# Setup dotfiles
echo "Setting up dotfiles..."
./bootstrap.sh --force

# Homebrew
echo "Installing Homebrew and Cask..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

# Install cask
brew install caskroom/cask/brew-cask

# Alternative cask versions
brew tap caskroom/versions

# Install fonts with cask
echo "Installing fonts..."
brew tap caskroom/fonts
brew cask install --appdir="/Applications" font-inconsolata
brew cask install --appdir="/Applications" font-source-code-pro
brew cask install --appdir="/Applications" monotype-skyfonts

# Install apps with Cask
echo "Installing OS X Apps..."
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" google-drive
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" evernote
brew cask install --appdir="/Applications" authy-bluetooth
brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" transmission
brew cask install --appdir="/Applications" paparazzi
brew cask install --appdir="/Applications" viscosity
brew cask install --appdir="/Applications" gpgtools
brew cask install --appdir="/Applications" steam
brew cask install --appdir="/Applications" grandperspective
brew cask install --appdir="/Applications" skype
brew cask install --appdir="/Applications" tagspaces
brew cask install --appdir="/Applications" the-unarchiver
brew cask install --appdir="/Applications" vlc
brew cask install --appdir="/Applications" android-file-transfer
brew cask install --appdir="/Applications" filezilla
brew cask install --appdir="/Applications" sketch
brew cask install --appdir="/Applications" screenhero

# Dev apps
brew cask install --appdir="/Applications/dev" sublime-text3
brew cask install --appdir="/Applications/dev" iterm2
brew cask install --appdir="/Applications/dev" heroku-toolbelt
brew cask install --appdir="/Applications/dev" virtualbox
brew cask install --appdir="/Applications/dev" vagrant
brew cask install --appdir="/Applications/dev" gitx-rowanj
brew cask install --appdir="/Applications/dev" robomongo
brew cask install --appdir="/Applications/dev" macdown
brew cask install --appdir="/Applications/dev" cyberduck
brew cask install --appdir="/Applications/dev" postgres
brew cask install --appdir="/Applications/dev" boot2docker
brew cask install --appdir="/Applications/dev" dash
brew cask install --appdir="/Applications/dev" pencil

# Install development tools with Homebrew
echo "Installing development tools..."
# General development tools
brew install bash-completion
brew install git
brew install mysql
brew install elasticsearch

# Python
brew install python3
brew install python

# GO
brew install go

echo "Install all the Java!!!"
# Official Oracle JDK
brew install cask java

# Java env handler
brew install jenv

# Java tools
brew install ant
brew install maven
brew install tomcat
brew install glassfish
brew install jetty

# This has to be tested
# echo "Registering all Java versions to JENV..."
# jdk_location='/Library/Java/JavaVirtualMachines/'
# jdks=($(ls $jdk_location))
#
# for i in "${jdks[@]}"
# do
#     echo jenv add "${jdk_location}${i}/Contents/Home"
# done

# Install nvm
echo "Installing nvm..."
curl https://raw.githubusercontent.com/creationix/nvm/v0.17.2/install.sh | PROFILE=~/.extras bash
source ~/.bash_profile

# Install latest v0.10.x release of node
echo "Installing node..."
# nvm install 0.10
nvm install stable
nvm use stable
nvm alias default 0.10

# Install Node.js global tools
echo "Installing global modules with npm..."
npm install -g npm
npm install -g bower
npm install -g ember-cli
npm install -g grunt-cli
npm install -g gulp
npm install -g jshint

# Install Python tools
echo "Installing Python tools"
mkdir ~/.virtualenvs
pip install virtualenvwrapper
pip3 install flake8

# Setup Sublime Text 3
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
ln -sf $PWD/sublime/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
ln -sf $PWD/sublime/Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings

app_store_list = (
    "Airmail 2"
    "Deckset"
    "Pomodoro One"
    "Lingo"
    "Tweetdeck"
    "XCode"
    "SW Empire at War"
    "MDB ACCDB Viewer"
    "iDraw"
    "Numbers"
    "Keynote"
    "Pages"
)
echo "Remember to install from App Store"
for i in "${app_store_list[@]}"
do
    echo $i
done

other_apps = (
"PyCharm"
"Intellij Idea"
"Android SDK"
"Fitbit"
"Minecraft...maybe..."
)
echo "You also have these apps to install if you want."
for i in "${other_apps[@]}"
do
    echo $i
done
