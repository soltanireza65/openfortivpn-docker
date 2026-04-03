FROM alpine:3.23

RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk add --no-cache tini openfortivpn ppp ca-certificates tinyproxy pgcli

COPY ./config/openfortivpn.config /etc/openfortivpn/config
COPY ./config/tinyproxy.conf /etc/tinyproxy/tinyproxy.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8888

ENTRYPOINT ["/sbin/tini","--","/entrypoint.sh"]
