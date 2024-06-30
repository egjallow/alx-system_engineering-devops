#!/bin/usr/env bash
#make changes

file {'etc/ssh/ssh_config':
    ensure => 'present',
}

file_line {'etc/ssh/ssh_config':
    path => 'etc/ssh/ssh_config',
    line => 'PasswordAuthentication no',
    match => 'PasswordAuthentication yes',
    replace => 'true',

}

 file_line {'etc/ssh/ssh_config':
  4     path => 'etc/ssh/ssh_config',
  5     line => 'IdentityFile ~/.ssh/config',
  6     match => '^IdentifyFile',
  7     ensure => 'present',
  8
  9 }
