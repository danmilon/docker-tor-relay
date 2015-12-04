#!/bin/sh

if [ ! -e "$TORRC" ]; then
    echo "configuration file $TORRC does not exist"
    exit 1
fi

TOR_CONFIG_FILE=/etc/tor/torrc
envsubst < "$TORRC" > "$TOR_CONFIG_FILE"
exec su -s /bin/sh tor -c "tor -f '$TOR_CONFIG_FILE'"
