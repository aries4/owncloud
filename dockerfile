FROM		    ubuntu:14.04
MAINTAINER	aries4

ADD         bootstrap.sh /usr/bin/


ENV         DEBIAN_FRONTEND noninteractive
RUN         dpkg-divert --local --rename --add /sbin/initctl && ln -sf /bin/true /sbin/initctl

RUN         sh -c "echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/community/xUbuntu_14.04/ /' >> 
			/etc/apt/sources.list.d/owncloud.list"
			apt-get update && \
            apt-get install -y owncloud wget
RUN			cd /root
RUN			wget http://download.opensuse.org/repositories/isv:ownCloud:community/xUbuntu_14.04/Release.key
RUN			apt-key add - < Release.key  

RUN        	chown -R www-data:www-data /var/www/owncloud && \
            chmod +x /usr/bin/bootstrap.sh

ADD         php.ini /etc/php5/fpm/
ADD         cron.conf /etc/oc-cron.conf
RUN         crontab /etc/oc-cron.conf

ADD         extensions.sh extensions.conf /var/www/owncloud/apps/
RUN         chmod a+x /var/www/owncloud/apps/extensions.sh ; \
            /var/www/owncloud/apps/extensions.sh /var/www/owncloud/apps/extensions.conf /var/www/owncloud/apps ; \
            rm /var/www/owncloud/apps/extensions.sh /var/www/owncloud/apps/extensions.conf

EXPOSE      80
EXPOSE      443

ENTRYPOINT  ["bootstrap.sh"]
