#!/bin/bash
source utils.sh

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
