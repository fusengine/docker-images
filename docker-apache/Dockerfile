FROM fusengine/apaxy
LABEL maintainer="Fusengine <info@fusengine.ch>"

# Version php define
ARG PHP_VERSION=7.3

# Default Email
ARG EMAIL_APACHE="localhost"

# Add script install php repos
ADD https://repos.php.earth/alpine/phpearth.rsa.pub /etc/apk/keys/phpearth.rsa.pub

COPY setup/php.sh /root/.install_php
RUN chmod +x /root/.install_php

# Run script install php if "sh /root/.install_php" or "./root/.install_php" --->
# --> not run write "bash /root/.install_php"
RUN sh /root/.install_php

# add Xdebug config
COPY conf/xdebug.ini /etc/php/$PHP_VERSION/conf.d/xdebug.ini

# Volume
VOLUME ["/etc/apache2/vhost.d", "/var/log/apache2", "/app/web"]

# WORKDIR
WORKDIR /app/web

EXPOSE 80
