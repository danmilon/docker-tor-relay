FROM alpine:3.7
LABEL maintainer="Dan Milon <i@danmilon.me>"

# Based on https://github.com/TheZ3ro/docker-tor-relay

ENV TORRC=/etc/tor/torrc.middle \
    TOR_NICKNAME=my-node \
    TOR_CONTACT_INFO=Anonymous \
    TOR_BANDWIDTH_RATE="1 GByte"

RUN \
 apk add \
    --repository http://dl-cdn.alpinelinux.org/alpine/v3.7/community \
    --repository http://dl-cdn.alpinelinux.org/alpine/v3.7/main \
    --no-cache \
    gettext \
    tor && \

 # restrict permissions otherwise you get this in the logs
 # [warn] Fixing permissions on directory /var/lib/tor
 chmod 700 /var/lib/tor

# default port to used for incoming Tor connections
# can be changed by changing 'ORPort' in torrc
EXPOSE 9001/tcp

COPY root /
VOLUME /var/lib/tor

ENTRYPOINT ["/etc/tor/config.sh"]
