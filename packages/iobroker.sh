#!/bin/sh -

# source:
# https://www.electronicstudio.de/iobroker-installation

#apt update && apt upgrade

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt install -y build-essential libavahi-compat-libdnssd-dev libudev-dev libpam0g-dev nodejs
curl -sL https://iobroker.net/install.sh | bash -

# increase swap on device with less than 1 GB RAM
sudo su -c 'echo "CONF_SWAPSIZE=1024" > /etc/dphys-swapfile'
sudo dphys-swapfile setup
sudo dphys-swapfile swapon
sudo dphys-swapfile swapon


