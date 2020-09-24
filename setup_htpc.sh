#!/bin/sh -
apt install puppet -y

#puppet module install biemond-jdk7 --version 1.1.0
puppet module install puppetlabs-apache --version 0.9.0
puppet module install AlexCline-fstab --version 0.5.4
#puppet module install thomasr-openhab2 --version 0.1.3


puppet apply manifest/manifest_htpc.pp


apt-cache search php5
#service apache2 restart


