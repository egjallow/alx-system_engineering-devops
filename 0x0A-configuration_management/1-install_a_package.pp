# installs puppet-lint
package { 'Flask':
  provider => 'pip3',
  ensure   => '2.1.0',
}
