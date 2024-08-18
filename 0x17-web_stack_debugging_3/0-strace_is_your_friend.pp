#modify config file

exec { 'fix_wordpress_php_typo':
  command => 'sed -i "s/phpp/php/g" /var/www/html/wp-settings.php',
  path    => ['/usr/bin', '/bin'],
  onlyif  => 'grep phpp /var/www/html/wp-settings.php',
  require => Service['apache2'],
}

