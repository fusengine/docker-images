FROM fusengine/apaxy
LABEL maintainer="Fusengine <info@fusengine.ch>"
ENV TIMEZONE Switzerland/Zurich

RUN echo "${TIMEZONE}" > /etc/timezone

# Add script install php repos
ADD https://repos.php.earth/alpine/phpearth.rsa.pub /etc/apk/keys/phpearth.rsa.pub

COPY setup/php.sh /root/.install_php
RUN chmod +x /root/.install_php

# Run script install php if "sh /root/.install_php" or "./root/.install_php" --->
# --> not run write "bash /root/.install_php"
RUN sh /root/.install_php

# add Xdebug config
COPY conf/xdebug.ini /etc/php/7.1/conf.d/xdebug.ini

# Add Module php7.1 (modules/mod_php.so) => modules/libphp7.so
COPY conf/php-module.conf /etc/apache2/conf.d/php7.1-module.conf

# Volume
VOLUME ["/etc/apache2/vhost.d", "/var/log/apache2", "/app/web"]

# WORKDIR
WORKDIR /app/web

EXPOSE 80
