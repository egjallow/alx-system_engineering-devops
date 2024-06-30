#!/usr/bin/env bash

file { '/etc/ssh/ssh_config':
  ensure => 'present',
}

file_line { 'disable_password_auth':
  path    => '/etc/ssh/ssh_config',
  line    => 'PasswordAuthentication no',
  match   => '^PasswordAuthentication',
  ensure  => 'present',
}

file_line { 'set_identity_file':
  path    => '/etc/ssh/ssh_config',
  line    => 'IdentityFile ~/.ssh/config',
  match   => '^IdentityFile',
  ensure  => 'present',
}

