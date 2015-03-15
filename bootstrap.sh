#!/bin/sh

echo "Starting server..\n"


/usr/sbin/cron -f &
/etc/init.d/apache2 start