# fixes wordpress file
 
exec { 'fix-wordpress_site':
    command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
    path    => '/usr/bin/:/bin/',
}
