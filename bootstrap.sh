#!/bin/sh


chown -R www-data:www-data /var/www/owncloud /owncloud
echo "Starting server..\n"


/usr/sbin/cron -f &
/etc/init.d/apache2 start