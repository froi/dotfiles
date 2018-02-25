#!/bin/bash
# Colors
function echoGreen() {
    prompt="$1"
    echo -e -n "\033[32m$prompt"
    echo -e -n '\033[0m'
    echo ''
}
function echoRed() {
    prompt="$1"
    echo -e -n "\033[31m$prompt"
    echo -e -n '\033[0m'
    echo ''
}
function echoBlue() {
    prompt="$1"
    echo -e -n "\033[34m$prompt"
    echo -e -n '\033[0m'
    echo ''
}

echoBlue "============== Setting up your environment =============="

echo -e "\n"
echoBlue "======= Bootstrapping environment ======="
./bootstrap.sh --force

echo -e "\n"
echoBlue "======= Installing Apps ======="
./install.sh

echoBlue "============== Cleaning Up =============="

unset createSymlinks
unset getDotFiles
unset echoBlue
unset echoRed

echoGreen "DONE"
unset echoGreen
