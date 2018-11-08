FROM gogs/gogs:latest
LABEL maintainer="Fusengine <info@fusengine.ch>"

# Copy Files
COPY docker ./docker
COPY templates ./templates
COPY public ./public

# Work directory Docker Container
WORKDIR /app/gogs

# Volumes Docker Container
VOLUME ["/data", "/app/gogs/public", "/app/gogs/templates"]

# port Docker Container
EXPOSE 22 3000
