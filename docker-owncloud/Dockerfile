FROM fusengine/nginx
MAINTAINER Fusengine <info@fusengine.ch>

# Env owncloud
ENV   OWNCLOUD_VERSION 9.0.1
ENV   OWNCLOUD_LINKS https://download.owncloud.org/community/owncloud-${OWNCLOUD_VERSION}.zip

# Add default to owncloud
ADD   nginx/default /etc/nginx/sites-enabled/default

# Download owncloud
ADD   ${OWNCLOUD_LINKS} /

# Unzip file
RUN   unzip owncloud-${OWNCLOUD_VERSION}.zip && \
 	   rm -fr owncloud-${OWNCLOUD_VERSION}.zip

# Move File to /var/www/
RUN   mv owncloud /var/www/owncloud && \
      chown -R www-data:www-data /var/www/owncloud

# Workdir
WORKDIR  /owncloud

# Port listen
EXPOSE   80
