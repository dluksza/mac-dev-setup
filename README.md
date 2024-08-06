# MacOS from scratch provisioning

After getting new Mac, finish the system setup process, install all Software Updates, then run:

``` sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/dluksza/mac-dev-setup/main/initial_setup.sh)"
```
 
## Tracking changes in `defaults`

MacOS uses the `defaults` (command) to store user preferences for the _System Settings_,
_Finder_ settings and many other applications. Using Ansible
[`community.general.osx_defaults`](https://docs.ansible.com/ansible/latest/collections/community/general/osx_defaults_module.html#ansible-collections-community-general-osx-defaults-module)
we can automatically provision selected settings.

To find the correct `domain`, `key` and `value` use the `tools/monitor-defaults-changes.sh`
script. To get the correct values:

 * start the script
 * modify app preferences
 * get back to the running script and press _enter_
 * examine the diff

If you can see the `domain` name in the diff output, have a look at
`/tmp/modified.defaults.plist` file.
