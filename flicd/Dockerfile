ARG BUILD_FROM
FROM $BUILD_FROM

# Setup base
RUN export ARCH=$(uname -m) ; \
    curl -fL "https://raw.githubusercontent.com/50ButtonsEach/fliclib-linux-hci/2.0.3/bin/$ARCH/flicd" -o /usr/bin/flicd ;\
    chmod +x /usr/bin/flicd

# Copy data
COPY data/run.sh /
RUN chmod +x /run.sh

# run flicd
CMD [ "/run.sh" ]
