FROM labengine/ubuntu-upstart
MAINTAINER Fusengine <info@fusengine.ch>

ENV COMPOSER_VERSION 1.0.0-alpha10
ENV GITHUB_TOKEN 8a2c6f02975e1f06a9e64a8dcba95f3faf344b1c

# Update Ubuntu
# RUN apt-get update && apt-get install php7.0-cli -y

# Install Composer
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=${COMPOSER_VERSION}
# RUN composer config --global github-oauth.github.com ${GITHUB_TOKEN}

# symfony installer Token_Composer
# RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony && \
#    chmod a+x /usr/local/bin/symfony && \
#    symfony self-update

# Add buildpack
COPY setup.sh /
RUN chmod 775 /*.sh

# Run buildpack
RUN ./setup.sh

# RUN apt-get dist-upgrade -y && apt-get upgrade -y


# RUN mkdir /data
# Volume mount
VOLUME ["/data", "/root/.composer"]

# Work directory
WORKDIR /data

# Composer & symfony command
RUN composer && symfony
