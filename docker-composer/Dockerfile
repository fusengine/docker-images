# Version Alpine
ARG IMAGE="fusengine/apaxy"
ARG VERSION=latest

# Docker Images
FROM $IMAGE:$VERSION
LABEL maintainer="Fusengine <info@fusengine.ch>"

# Version php And Alpine version
ENV PHP_VERSION=7.3
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

# Composer version
# Allow Composer to be run as root
# Add global binary directory to PATH and make sure to re-export it
ARG COMPOSER_VERSION="1.8.5"
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV PATH /composer/vendor/bin:$PATH

# Add buildpack
COPY scripts/composer_build.sh /.composer_build.sh
RUN chmod 775 /.composer_build.sh

# Run buildpack
RUN /.composer_build.sh

# Create Directory
RUN mkdir -p /app

# Volume mount
VOLUME ["/app", "/root/.composer"]

# Work directory
WORKDIR /app

# Display version information.
RUN composer --version
