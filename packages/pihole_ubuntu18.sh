#!/bin/sh -

sudo add-apt-repository universe
curl -sSL https://install.pi-hole.net | bash
wget -O basic-install.sh https://install.pi-hole.net
sudo bash basic-install.sh

# change password
pihole -a -p