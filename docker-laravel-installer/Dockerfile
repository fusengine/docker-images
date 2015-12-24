FROM fusengine/php7
MAINTAINER Fusengine <info@fusengine.ch>

ENV COMPOSER_VERSION 1.0.0-alpha11

RUN apt-get update
RUN apt-get install -y \
            curl

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=${COMPOSER_VERSION}

# symfony installer
RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony && \
    chmod a+x /usr/local/bin/symfony && \
    symfony self-update

# laravel installer
RUN composer global require "laravel/installer" && \
    export PATH="$PATH:$HOME/.composer/vendor/bin" && \
    echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ~/.bashrc

# Work directory
WORKDIR /var/www/html

# Volume mount
VOLUME ["/var/www/html"]


# laravel command
CMD ["laravel", "symfony", "composer"]
