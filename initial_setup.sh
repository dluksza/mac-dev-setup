#!/usr/bin/env sh

echo 'Updating system ...'
softwareupdate --install --all --restart &> /dev/null
echo 'DONE'

if ! (xcode-select -p); then
    echo 'Installing Command Line Tools (you can track progress in System Settings > General > Software Update)...'
    xcode-select --install &> /dev/null
    softwareupdate --install --all
    echo ' DONE'
fi

echo 'Upgading Python3 ...'
sudo pip3 install --upgrade pip
echo ' DONE'

echo 'Installing Ansible ...'
pip3 install ansible
echo ' DONE'

echo -n 'Provisioning using `ansible-pull`'
~/Library/Python/3.9/bin/ansible-pull -U https://github.com/dluksza/mac-dev-setup.git
