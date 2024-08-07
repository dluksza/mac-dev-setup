#!/usr/bin/env sh

ansible_path=~/Library/Python/3.9/bin/ansible-pull

echo 'Updating system ...'
sudo softwareupdate --install --all --restart >/dev/null 2>&1
echo 'DONE'

if ! (xcode-select -p >/dev/null 2>&1); then
    echo 'Installing Command Line Tools (you can track progress in System Settings > General > Software Update)...'
    xcode-select --install >/dev/null 2>&1
    softwareupdate --install --all
    printf '\t Confirm accepting Xcode license'
    sudo xcodebuild -license accept
    echo ' DONE'
fi

if ! [ -e $ansible_path ]; then
    echo 'Upgrading Python3 ...'
    sudo pip3 install --upgrade pip
    echo ' DONE'

    echo 'Installing Ansible ...'
    pip3 install ansible
    echo ' DONE'
fi

echo 'Provisioning using ansible-pull'
$ansible_path --ask-become-pass --url https://github.com/dluksza/mac-dev-setup.git
