#!/bin/sh


touch /var/log/cron/owncloud.log


chown -R www-data:www-data /var/www/owncloud /owncloud
echo "Starting server..\n"

tail -F  /var/log/cron/owncloud.log &

/usr/sbin/cron -f &
/etc/init.d/php5-fpm start
/etc/init.d/apache2 start