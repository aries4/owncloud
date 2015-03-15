FROM		ubuntu:14.04
MAINTAINER	aries4

ADD         bootstrap.sh /usr/bin/

RUN         sh -c "echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/community/xUbuntu_14.04/ /' >> /etc/apt/sources.list.d/owncloud.list"
RUN			apt-get update && \
            apt-get install -y --force-yes owncloud wget
RUN			cd /root
RUN			wget http://download.opensuse.org/repositories/isv:ownCloud:community/xUbuntu_14.04/Release.key
RUN			apt-key add - < Release.key  

RUN        	chown -R www-data:www-data /var/www/owncloud && \
            chmod +x /usr/bin/bootstrap.sh

ADD         cron.conf /etc/oc-cron.conf
RUN         crontab /etc/oc-cron.conf


EXPOSE      80
EXPOSE      443


