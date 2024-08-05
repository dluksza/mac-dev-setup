#!/usr/bin/env sh

echo -n 'Updating system ...'
softwareupdate --install --all --restart
echo 'DONE'

echo -n 'Installing XCode Command Line Tools...'
xcode-select --install
echo ' DONE'

echo -n 'Upbrading Python3 ...'
sudo pip3 install --upgrade pip
echo ' DONE'

echo -n 'Installing Ansible ...'
pip3 install ansible
echo ' DONE'

echo -n 'Provisioning using `ansible-pull`'
ansible-pull -U https://github.com/dluksza/dev-mac-setup.git
