#!/usr/bin/with-contenv bashio
# shellcheck shell=bash
#
# Home Assistant addon for Flicd.
#
set -e

HCI_DEV=$(bashio::config 'hci_dev')
FLICD_PORT=$(bashio::addon.port 5551)

# start server
bashio::log.info "Running flicd..."
exec /usr/bin/flicd -f /data/flic-db -s "0.0.0.0" -p "$FLICD_PORT" "$HCI_DEV"
