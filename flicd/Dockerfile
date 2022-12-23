ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_ARCH
ARG BUILD_VERSION

# Setup base
RUN case $(BUILD_ARCH) in \
        x86_64|amd64) export ARCH=x86_64 ;; \
        i386) export ARCH=i386 ;; \
        armv6l|armv7l) export ARCH=armv6l ;; \
        aarch64) export ARCH=aarch64 ;; \
    esac && \
    export FLICD_URL="https://raw.githubusercontent.com/50ButtonsEach/fliclib-linux-hci/${BUILD_VERSION}/bin/${ARCH}/flicd" ; \
    curl -fL "$FLICD_URL" -o /usr/bin/flicd ;\
    chmod +x /usr/bin/flicd

# Copy data
COPY data/run.sh /
RUN chmod +x /run.sh

# run flicd
CMD [ "/run.sh" ]
