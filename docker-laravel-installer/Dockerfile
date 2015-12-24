FROM fusengine/php7
MAINTAINER Fusengine <info@fusengine.ch>

ENV COMPOSER_VERSION 1.0.0-alpha11

# Update Ubuntu
RUN apt-get update

# Install app
RUN apt-get install -y \
                  curl

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=${COMPOSER_VERSION}
RUN composer config -g github-oauth.github.com e7302df6e8e65075bbe1fbe7d794b0304172bd09

# symfony installer
RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony && \
    chmod a+x /usr/local/bin/symfony && \
    symfony self-update

# laravel installer
RUN composer global require "laravel/installer" && \
    export PATH="~/.composer/vendor/bin:$PATH"  && \
    echo "alias laravel='~/.composer/vendor/bin/laravel'" >> ~/.bashrc

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
