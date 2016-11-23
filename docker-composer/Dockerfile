FROM labengine/ubuntu
MAINTAINER Fusengine <info@fusengine.ch>

# Composer version
ENV COMPOSER_VERSION 1.2.2
# Allow Composer to be run as root
ENV COMPOSER_ALLOW_SUPERUSER 1
# Add global binary directory to PATH and make sure to re-export it
ENV PATH $PATH:$HOME/.composer/vendor/bin

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