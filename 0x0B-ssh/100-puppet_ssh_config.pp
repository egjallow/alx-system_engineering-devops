#!/usr/bin/env bash

file { '/etc/ssh/ssh_config':
  ensure => 'present',
}

file_line { 'disable_password_auth':
  ensure => 'present',
  path   => '/etc/ssh/ssh_config',
  line   => 'PasswordAuthentication no',
  match  => '^PasswordAuthentication',
}

file_line { 'set_identity_file':
  ensure => 'present',
  path   => '/etc/ssh/ssh_config',
  line   => 'IdentityFile ~/.ssh/config',
  match  => '^IdentityFile',
}

