FROM alpine:3.22.2

RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk add --no-cache \
    openfortivpn \
    ppp \
    ca-certificates \
    tinyproxy \
    pgcli

COPY ./config/openfortivpn.config /etc/openfortivpn/config
COPY ./config/tinyproxy.conf /etc/tinyproxy/tinyproxy.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8888

CMD ["sh", "-c", "/entrypoint.sh"]

