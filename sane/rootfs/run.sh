#!/usr/bin/with-contenv bashio

ulimit -n 1048576

#until [ -e /var/run/avahi-daemon/socket ]; do
#  sleep 1s
#done

bashio::log.info "Starting SANEd server as CMD from S6"

saned -l --user=root
