FROM ubuntu:18.04
LABEL maintainer="Fusengine <info@fusengine.ch>"

# Version Package
ARG ARCH="x64"
ARG VERSION="stable"
ARG LINK="https://download-cdn.resilio.com/${VERSION}/linux-${ARCH}/resilio-sync_${ARCH}.tar.gz"

# Download and decompress rlsync to directory
ADD ${LINK} /tmp/sync.tgz
RUN tar -xf /tmp/sync.tgz -C /usr/bin rslsync && rm -f /tmp/sync.tgz

# Copy script to run resilio
COPY scripts/sync.conf.default /etc/
COPY scripts/run_sync /usr/bin/

# fix permission to run "rslsync.sh"
RUN chmod 777 /usr/bin/run_sync

# Work dir
WORKDIR /sync

# Directory sync
VOLUME "/sync/config", "/sync/folders", "/sync/downloads"

# Port expose 8888 is webui
EXPOSE 8888 55555

# Command start rlsync
ENTRYPOINT ["/usr/bin/run_sync"]
CMD ["--config", "/sync/sync.conf"]
