#!/bin/bash

# Get file list
function getDotFiles() {
    find dotfiles/ -type f -name '.*' -exec basename {} ';'
}

# Set vars
FILES=$(getDotFiles)
CURRENTPATH=$(pwd)
FORCE=false

# Change value of FORCE
if [ "$1" == "--force" ]; then
    FORCE=true
fi

for F in ${FILES[@]}; do
    # Delete files if --force was used
    if [ $FORCE == true ]; then
        echoRed "--> [DELETE]: $HOME/${F}"
        rm $HOME/$F
    fi

    # Make symlink
    echoGreen "--> [LINK]: ${CURRENTPATH}/dotfiles/${F} -> ${HOME}/${F}"
    ln -s $CURRENTPATH/dotfiles/$F $HOME/$F

    if [ $? -eq 1 ]; then
        echo
        echoRed "--> [ERROR]: You have already have a file named ${F} in your home folder."
        echoRed "    Please backup of your old files."
        echoRed "    Using \"--force\" will allow you to overwrite your existing files."
        echo
        break
    fi
done

if [ $FORCE == true ]; then
    echoRed "--> [DELETE]: $HOME/.hammerspoon/init.lua"
    rm $HOME/.hammerspoon/init.lua
fi
echoGreen "--> [LINK]: ${CURRENTPATH}/app_files/hammerspoon-init.lua -> ${HOME}/.hammerspoon/init.lua"
ln -s $CURRENTPATH/app_files/hammerspoon/init.lua $HOME/.hammerspoon/init.lua

source ~/.bash_profile

echoBlue "--> [DONE]"