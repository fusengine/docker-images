FROM labengine/php
MAINTAINER Fusengine <info@fusengine.ch>

ENV COMPOSER_VERSION 1.0.0-alpha8

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=${COMPOSER_VERSION}

# Display version information
RUN composer --version
