FROM fusengine/apaxy:alpine-apaxy-v2
MAINTAINER Fusengine <info@fusengine.ch>

# Add script install php repos
COPY setup/php /root/.install_php
RUN chmod +x /root/.install_php

# link adminer
COPY setup/header.html /app/theme

# Run script install php if "sh /root/.install_php" or "./root/.install_php" --->
# --> not run write "bash /root/.install_php"
RUN sh /root/.install_php

# add Xdebug config
COPY conf/xdebug.ini /etc/php5/conf.d/xdebug.ini

# Volume
VOLUME ["/etc/apache2/vhost.d", "/var/log/apache2", "/app/web"]

# WORKDIR
WORKDIR /app/web

EXPOSE 80