FROM fusengine/php7
MAINTAINER Fusengine <info@fusengine.ch>

ENV COMPOSER_VERSION 1.0.0-alpha11
ENV GITHUB_TOKEN e31452ae6b0d084545eb4726e16793bfd3328211

# Update Ubuntu
RUN apt-get update

# Install app
RUN apt-get install -y \
                  curl

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=${COMPOSER_VERSION}
RUN composer config --global github-oauth.github.com ${GITHUB_TOKEN}

# symfony installer
RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony && \
    chmod a+x /usr/local/bin/symfony && \
    symfony self-update

# laravel installer
RUN composer global require "laravel/installer=1.3" && \
    echo "alias laravel='~/.composer/vendor/bin/laravel'" >> ~/.bashrc

RUN apt-get dist-upgrade -y && apt-get upgrade -y
# reload bashrc
RUN . ~/.bashrc

# Work directory
WORKDIR /var/www/html

# Volume mount
VOLUME ["/var/www/html"]

# Composer & symfony command
RUN composer && \
    symfony


# ========================================================================================================== #
#                                                 draft                                                      #
# ========================================================================================================== #
#          export PATH="$PATH:$HOME/.composer/vendor/bin" && \                                               #
#          echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ~/.bashrc && \                           #
# ========================================================================================================== #
