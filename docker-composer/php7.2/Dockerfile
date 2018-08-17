FROM labengine/alpine
LABEL maintainer="Fusengine <info@fusengine.ch>"

# Add script install php repos
ADD https://repos.php.earth/alpine/phpearth.rsa.pub /etc/apk/keys/phpearth.rsa.pub

# Composer version
# Allow Composer to be run as root
# Add global binary directory to PATH and make sure to re-export it
ARG COMPOSER_VERSION="1.7.2"
ENV COMPOSER_ALLOW_SUPERUSER 1
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
