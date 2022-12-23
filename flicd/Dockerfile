ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_ARCH
ARG BUILD_VERSION
ARG FLICD_VERSION

# switch to bash
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get --assume-yes install git curl ; \
    case $BUILD_ARCH in \
        x86_64|amd64) export ARCH=x86_64 ;; \
        i386) export ARCH=i386 ;; \
        armhf|armv7) export ARCH=armv6l ;; \
        aarch64) export ARCH=aarch64 ;; \
    esac && \
    curl -fL "https://raw.githubusercontent.com/50ButtonsEach/fliclib-linux-hci/${FLICD_VERSION}/bin/${ARCH}/flicd" -o /usr/bin/flicd ; \
    chmod +x /usr/bin/flicd ; \
    apt-get --assume-yes remove git && apt-get --assume-yes autoremove ; \
    rm -rf /var/cache/apt && rm -rf /tmp/src

# Copy data
COPY data/run.sh /
RUN chmod +x /run.sh

# run flicd
CMD [ "/run.sh" ]
