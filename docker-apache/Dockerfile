# Version Alpine
ARG     IMAGE="fusengine/apaxy"
ARG     VERSION="alpinev3.12-apaxy"

# Docker Images
FROM    $IMAGE:$VERSION

LABEL   build_version="8.0" 
LABEL   maintainer="Fusengine <info@fusengine.ch>"
LABEL   description="Image Base to apaxy v2 and codecasts php-alpine"

# Version php And Alpine version
ARG 	PHP="php8"
ENV     PHP_VERSION="8.0"
ENV     ALPINE_VERSION="v3.12"
ENV     RSA_PUB="php-alpine.rsa.pub"


# Jit config
ENV 	ZEND_EXTENSION="opcache.so"
ENV		OPCACHE_ENABLE="1"
ENV 	OPCACHE_ENABLE_CLI="1"
ENV 	JIT_BUFFER_SIZE="50M"
ENV 	JIT="tracing"

# Option php Repos
ENV     OPTION_REPOS_PHP_KEY="https://dl.bintray.com/php-alpine/key/$RSA_PUB"
ENV     OPTION_REPOS_PHP_PATH="https://dl.bintray.com/php-alpine/$ALPINE_VERSION/php-$PHP_VERSION"
ARG     OPTION_REPOS_DIR_KEY="/etc/apk/keys/$RSA_PUB"
ARG     OPTION_REPOS_DIR_PATH="/etc/apk/repositories"

# Define Volume
ARG     VHOST_DIR="/etc/apache2/vhost.d"
ARG     APACHE_LOG="/var/log/apache2"
ARG     WEB_DIR="/app/web"

# Default Email
ARG     EMAIL_APACHE="localhost"

# Add script install php repos
ADD     $OPTION_REPOS_PHP_KEY $OPTION_REPOS_DIR_KEY

# Copy Script install
COPY    setup/php.sh /root/.install_php
RUN     chmod +x /root/.install_php

# Run script install php if "sh /root/.install_php" or "./root/.install_php" --->
# --> not run write "bash /root/.install_php"
RUN     sh /root/.install_php

# Fix Can't locate API module structure `php8_module'
COPY 	conf/php8-module.conf /etc/apache2/conf.d/php8-module.conf

# JIT config
COPY 	conf/00_php8-jit.ini /etc/php8/conf.d/00_php8-jit.ini

# add Xdebug config
COPY    conf/xdebug.ini /etc/php8/conf.d/00_xdebug.ini

# Volume
VOLUME  ["$VHOST_DIR", "$APACHE_LOG", "$WEB_DIR"]

# WORKDIR
WORKDIR     $WEB_DIR

# PORT App
EXPOSE  80
