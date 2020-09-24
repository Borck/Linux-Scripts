sudo apt-get install -y wget

# install puppet agent 6


wget https://apt.puppetlabs.com/puppet6-release-bionic.deb
touch /etc/apt/sources.list.d/puppet6.list
touch /etc/apt/trusted.gpg.d/puppet6-keyring.gpg
sudo dpkg -i puppet6-release-bionic.deb

sudo add-apt-repository multiverse
sudo apt update
sudo apt -y install puppetserver

sudo systemctl start puppetserver
#sudo service puppetserver start