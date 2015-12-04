# Dockerized Tor Relay server

A simple Docker container for running a Tor relay server.

The container is also configured to listen on port 9001 for the relay
traffic. Make sure to open the in your firewall.

## Usage

Running the relay is super simple.

    $ docker run -d \
        -p 9001:9001 \
        --restart=always \
        -e 'TORRC=/etc/tor/torrc.middle' \
        -e 'TOR_NICKNAME=hacktheplanet' \
        --name=torrelay \
        danmilon/tor-relay

## Configuration

Configuration is available via the following environmental variables:

* `TORRC`: The configuration file to use, depending on the node type. See below.
* `TOR_NICKNAME`: The [nickname] to advertise. Defaults to `Anonymous`.
* `TOR_CONTACT_INFO`: [Contact information] to advertise.

#### Set your node type

You can set your node type by changing the torrc file.
There are 3 configuration, Bridge Exit and Middle Node.

    -e 'TORRC=/etc/tor/torrc.middle' \
    -e 'TORRC=/etc/tor/torrc.bridge' \
    -e 'TORRC=/etc/tor/torrc.exit' \

#### Docker volumes

The private keys of the node are generated on the first time it boots up and
are stored under `/var/lib/tor`.


[nickname]: https://www.torproject.org/docs/tor-manual.html.en#Nickname
[Contact information]: https://www.torproject.org/docs/tor-manual.html.en#ContactInfo
