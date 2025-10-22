# OpenFortiVpn in Docker

This runs openfortivpn in docker and exposes an http proxy

## Usage

1. Put your configuration of openfortivpn inside config (rename config.example to config and fill it)
2. Run

```bash
docker compose up -d
```

## Edit and add to your '.gitconfig' file

```
[http "https://example.com"]
    proxy = http://127.0.0.1:8888
```

## Same for .ssh/config

```
Host example.com
  User git
  HostName example.com
  ProxyCommand nc -X connect -x 127.0.0.1:8888 %h %p
```
