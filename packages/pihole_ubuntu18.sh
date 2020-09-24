#!/bin/sh -

sudo add-apt-repository universe
curl -sSL https://install.pi-hole.net | bash

# change password
pihole -a -p