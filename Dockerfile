FROM alpine:3.22.2

RUN apk add openfortivpn --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/

RUN apk add ppp ca-certificates tinyproxy

COPY entrypoint.sh /

EXPOSE 8888

CMD ["sh", "-c", "/entrypoint.sh"]

