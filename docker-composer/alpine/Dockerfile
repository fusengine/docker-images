FROM labengine/alpine
MAINTAINER Fusengine <info@fusengine.ch>

# Add script install php repos
ADD https://php.codecasts.rocks/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

# Composer version
ENV COMPOSER_VERSION 1.5.1

# Allow Composer to be run as root
ENV COMPOSER_ALLOW_SUPERUSER 1

# Add global binary directory to PATH and make sure to re-export it
ENV PATH /composer/vendor/bin:$PATH

# Add buildpack
COPY scripts/composer_build.sh /
RUN chmod 775 /*.sh

# Run buildpack
RUN ./composer_build.sh

# Create Directory
RUN mkdir -p /app

# Volume mount
VOLUME ["/app", "/root/.composer"]

# Work directory
WORKDIR /app

# Display version information.
RUN composer --version