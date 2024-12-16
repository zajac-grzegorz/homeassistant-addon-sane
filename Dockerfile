ARG BUILD_FROM=ghcr.io/hassio-addons/base:15.0.7
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

LABEL io.hass.version="1.0" io.hass.type="addon" io.hass.arch="aarch64|amd64"

# Set shell
SHELL ["/bin/ash", "-o", "pipefail", "-c"]

# Add env
ENV TERM="xterm-256color"

# Setup base
RUN apk add --no-cache \
    nano \
    sane \
    sane-saned \
    sane-utils \
    sane-backend-net \
    sane-backend-hpljm1005 

### sane-backend-hpaio

# Copy root filesystem
COPY rootfs /

RUN chmod a+x /run.sh

CMD ["/run.sh"]
