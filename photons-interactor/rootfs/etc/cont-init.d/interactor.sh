#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Add-on: Photons Interactor
# ==============================================================================


if ! bashio::fs.directory_exists '/config/photons/'; then
    mkdir -p /config/photons/ \
        || bashio::exit.nok "Failed to create Photons Interactor configuration directory"

    bashio::var.json \
        port "^$(bashio::addon.port 6100)" \
        | tempio \
            -template /usr/share/tempio/interactor.yml.template \
            -out /config/photons/interactor.yml

fi
