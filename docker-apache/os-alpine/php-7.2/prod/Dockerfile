# Version Alpine
ARG IMAGE="fusengine/apaxy"
ARG VERSION=alpinev3.9-noapaxy

FROM $IMAGE:$VERSION
LABEL maintainer="Fusengine <info@fusengine.ch>"

# Version php And Alpine version
ENV PHP_VERSION=7.2
ENV ALPINE_VERSION="v3.9"

# Option php Repos
ENV OPTION_REPOS_PHP_KEY="https://repos.php.earth/alpine/phpearth.rsa.pub"
ENV OPTION_REPOS_PHP_PATH="https://repos.php.earth/alpine/$ALPINE_VERSION"
ARG OPTION_REPOS_DIR_KEY="/etc/apk/keys/phpearth.rsa.pub"
ARG OPTION_REPOS_DIR_PATH="/etc/apk/repositories"

# Define Volume
ARG VHOST_DIR="/etc/apache2/vhost.d"
ARG APACHE_LOG="/var/log/apache2"
ARG WEB_DIR="/app/web"

# Default Email
ARG EMAIL_APACHE="localhost"

# Add script install php repos
ADD $OPTION_REPOS_PHP_KEY $OPTION_REPOS_DIR_KEY

# Copy Script install
COPY setup/php.sh /root/.install_php
RUN chmod +x /root/.install_php

# Run script install php if "sh /root/.install_php" or "./root/.install_php" --->
# --> not run write "bash /root/.install_php"
RUN sh /root/.install_php

# Volume
VOLUME ["$VHOST_DIR", "$APACHE_LOG", "$WEB_DIR"]

# WORKDIR
WORKDIR $WEB_DIR

EXPOSE 80
