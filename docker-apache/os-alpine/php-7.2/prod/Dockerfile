# Version Alpine
ARG     IMAGE="fusengine/apaxy"
ARG     VERSION="alpinev3.8-noapaxy"

# Docker Images
FROM    $IMAGE:$VERSION

LABEL   build_version="7.2" 
LABEL   maintainer="Fusengine <info@fusengine.ch>"
LABEL   description="Image Base to no apaxy v2 and codecasts php-alpine"

# Version php And Alpine version
ENV     PHP_VERSION="7.2"
ENV     ALPINE_VERSION="v3.8"
ENV     RSA_PUB="php-alpine.rsa.pub"

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

# Volume
VOLUME  ["$VHOST_DIR", "$APACHE_LOG", "$WEB_DIR"]

# WORKDIR
WORKDIR $WEB_DIR

# PORT App
EXPOSE 80
