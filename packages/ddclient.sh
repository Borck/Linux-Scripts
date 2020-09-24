#!/bin/sh -

apt-get install -y ddclient

sudo systemctl start ddclient
#sudo service ddclient start
