#!/bin/bash
# 
# Download and execute with the following:
# curl -L https://embt.co/SetupUbuntu4Delphi22 | bash
#
echo "Updating the local package directory"
sudo apt update 
echo "Upgrading any outdated pacakges"
sudo apt full-upgrade -y
echo "Install new packages necessary for Delphi & FMXLinux"
sudo apt install joe python3 libpython3-dev wget p7zip-full curl libgtk-3-dev openssh-server build-essential zlib1g-dev libgtk-3-dev libcurl4-gnutls-dev libncurses5 xorg libgl1-mesa-dev libosmesa-dev libgtk-3-bin -y
echo "Clean-up unused packages"
sudo apt autoremove -y
cd ~
echo "Downloading Linux PAServer for Alexandria 11 (22.0)"
wget https://github.com/felipemesturini/scripts-paserver/raw/df5e35856a03fa8f3b3fdd372da8205188acf30d/PAServer22.0.tar.gz
echo "Setting up directories to extract PA Server into"
mkdir PAServer
mkdir PAServer/22
rm -r PAServer/22/*
tar xvf LinuxPAServer22.0.tar.gz -C PAServer/22 --strip-components=1
# This fixes the Python 3.6 dependency
ln -sf `ls -1 /usr/lib/x86_64-linux-gnu/libpython3.*.so.1.0 | tail -1` ~/PAServer/22.0/lldb/lib/libpython3.so
rm PAServer22.0.tar.gz
echo \#\!\/bin\/bash >pa22.sh
echo # https://docwiki.embarcadero.com/RADStudio/en/Setting_Options_for_the_Platform_Assistant >>pa22.sh
echo ~/PAServer/22.0/paserver --password=123456 >>pa22.sh
chmod +x pa22.sh
echo "-----------------------------------"
echo " To launch PAServer type ~/pa22.sh"
echo "-----------------------------------"
# ~/pa22.sh