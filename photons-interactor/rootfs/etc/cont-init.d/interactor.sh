#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Add-on: Photons Interactor
# ==============================================================================
ip_address=$(bashio::network.ipv4_address)
port=$(bashio::addon.port 6100)
hostname=$(bashio::host.hostname)


if ! bashio::fs.directory_exists '/config/photons/'; then
    mkdir -p /config/photons/ \
        || bashio::exit.nok "Failed to create Photons Interactor configuration directory"

    bashio::var.json \
        interface "$ip_address" \
        port "$port" \
        hostname "$hostname" \
        | tempio \
            -template /usr/share/tempio/interactor.yml.template \
            -out /config/photons/interactor.yml

fi
