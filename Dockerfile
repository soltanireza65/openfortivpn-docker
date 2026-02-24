FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        openfortivpn \
        ppp \
        ca-certificates \
        tinyproxy \
        pgcli \
        vim \
        less \
        && rm -rf /var/lib/apt/lists/*

# Copy configuration files
COPY ./config/openfortivpn.config /etc/openfortivpn/config
COPY ./config/tinyproxy.conf /etc/tinyproxy/tinyproxy.conf

# Copy entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8888

CMD ["sh", "-c", "/entrypoint.sh"]