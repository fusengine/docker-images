FROM labengine/ubuntu-upstart
MAINTAINER Fusengine <info@fusengine.ch>

# FIX Apache/PHP write permissions to the app
ENV OSX_BOOT2DOCKER_ID 1000
ENV OSX_BOOT2DOCKER_GID 50
ENV OSX_BOOT2DOCKER_ID 1000

RUN usermod -u ${OSX_BOOT2DOCKER_ID} www-data && \
    usermod -G staff www-data
RUN groupmod -g $(($OSX_BOOT2DOCKER_GID + 10000)) $(getent group $OSX_BOOT2DOCKER_GID | cut -d: -f1)
RUN groupmod -g ${OSX_BOOT2DOCKER_GID} staff

# Add buildpack
COPY config.sh /
RUN chmod 755 /*.sh

# Run buildpack
RUN ./config.sh

# Add apaxy and adminer
COPY config/apaxy/ /app

# Add conf files to work /app
ADD config/sites-enable/000-default.conf /etc/apache2/sites-enabled/
ADD config/sites-available/000-default.conf /etc/apache2/sites-available/
ADD config/apache2.conf /etc/apache2/

# Add image configuration and scripts
ADD apache.sh /apache.sh
RUN chmod 755 /*.sh

# Volume
VOLUME ["/etc/apache2/sites-enabled", "/var/log/apache2", "/app/web"]

# Work directory
WORKDIR /app/web

RUN php --version

# Expose port
EXPOSE 80

#start apache2
CMD ["/apache.sh"]
