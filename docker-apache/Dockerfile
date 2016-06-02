FROM labengine/ubuntu
MAINTAINER Fusengine <info@fusengine.ch>

# FIX Apache/PHP write permissions to the app
ENV OSX_BOOT2DOCKER_ID 1000
ENV OSX_BOOT2DOCKER_GID 50
ENV OSX_BOOT2DOCKER_ID 1000
ENV ADMINER_VERSION 4.2.5

RUN usermod -u ${OSX_BOOT2DOCKER_ID} www-data && \
    usermod -G staff www-data
RUN groupmod -g $(($OSX_BOOT2DOCKER_GID + 10000)) $(getent group $OSX_BOOT2DOCKER_GID | cut -d: -f1)
RUN groupmod -g ${OSX_BOOT2DOCKER_GID} staff

# Add buildpack
COPY scripts/install_bundle.sh /root/install_bundle.sh
RUN chmod +x /root/install_bundle.sh

# Run buildpack
RUN ./root/install_bundle.sh

# Add apaxy
COPY config/apaxy/ /app

# Add Latest Adminer
ADD https://www.adminer.org/static/download/${ADMINER_VERSION}/adminer-${ADMINER_VERSION}.php /app/adminer.php
RUN chmod 777 /app/adminer.php

# Add conf files to work /app
COPY config/sites-enable/000-default.conf /etc/apache2/sites-enabled/
COPY config/sites-available/000-default.conf /etc/apache2/sites-available/
COPY config/apache2.conf /etc/apache2/

# Add image configuration and scripts
COPY scripts/start_apache.sh /start_apache.sh
RUN chmod +x /start_apache.sh

# Volume
VOLUME ["/etc/apache2/sites-enabled", "/var/log/apache2", "/app/web"]

# Work directory
WORKDIR /app/web

# Expose port
EXPOSE 80

#start apache2
CMD ["/start_apache.sh"]
