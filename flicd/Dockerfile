ARG BUILD_FROM
FROM $BUILD_FROM

# Setup base
RUN export ARCH=$(uname -m) ; \
    export FLICD_URL="https://raw.githubusercontent.com/50ButtonsEach/fliclib-linux-hci/2.0.3/bin/${ARCH}/flicd" ; \
    curl -fL "$FLICD_URL" -o /usr/bin/flicd ;\
    chmod +x /usr/bin/flicd

# Copy data
COPY data/run.sh /
RUN chmod +x /run.sh

# run flicd
CMD [ "/run.sh" ]
