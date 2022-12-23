ARG BUILD_FROM
FROM $BUILD_FROM

# Setup base
RUN apk add --no-cache git ; \
    case $(BUILD_ARCH) in \
        x86_64|amd64) export ARCH=x86_64 ;; \
        i386) export ARCH=i386 ;; \
        armv6l|armv7l) export ARCH=armv6l ;; \
        aarch64) export ARCH=aarch64 ;; \
    esac && \
    git clone --depth 1 -b "${BUILD_VERSION}" \
        https://github.com/50ButtonsEach/fliclib-linux-hci \
        /tmp/src && \
    cp "/tmp/src/bin/${ARCH}/flicd" /usr/bin/flicd && \
    chmod +x /usr/bin/flicd; \
    rm -rf /tmp/src

# Copy data
COPY data/run.sh /
RUN chmod +x /run.sh

# run flicd
CMD [ "/run.sh" ]
