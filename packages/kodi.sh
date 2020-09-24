#!/bin/sh -

# install xserver
apt install -y xorg openbox

# install HDMI CEC libs
apt install cec-utils -y


# add user and group
useradd -U -G dialout,audio,video -d /var/lib/kodi -s /usr/bin/nologin kodi
passwd -l kodi > /dev/null
mkdir /var/lib/kodi
chown -R kodi:kodi /var/lib/kodi


apt install -y kodi