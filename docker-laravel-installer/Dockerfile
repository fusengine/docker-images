FROM fusengine/php7
MAINTAINER Fusengine <info@fusengine.ch>

ENV COMPOSER_VERSION 1.0.0-alpha11
ENV GITHUB_TOKEN 8a2c6f02975e1f06a9e64a8dcba95f3faf344b1c

# Update Ubuntu
RUN apt-get update && apt-get install curl -y

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=${COMPOSER_VERSION}
RUN composer config --global github-oauth.github.com ${GITHUB_TOKEN}

# symfony installer Token_Composer
RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony && \
    chmod a+x /usr/local/bin/symfony && \
    symfony self-update

# laravel installer
RUN composer global require "laravel/installer" --prefer-source && \
    export PATH="$PATH:$HOME/.composer/vendor/bin" && \
    echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' > /root/.bashrc && \
    echo "alias laravel='~/.composer/vendor/bin/laravel'" > /root/.bashrc

RUN apt-get dist-upgrade -y && apt-get upgrade -y
# reload bashrc
RUN echo '/root/.bashrc'

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
