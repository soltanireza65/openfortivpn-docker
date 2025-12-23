# OpenFortiVpn in Docker

This runs openfortivpn in docker and exposes an http proxy

## Usage

1. Put your configurations inside config dir (copy and fill secrets)

```bash
cp config/openfortivpn.config.example config/openfortivpn.config
cp config/tinyproxy.conf.example config/tinyproxy.conf
```

2. Run

```bash
docker compose up -d
```

## Edit and add to your '.gitconfig' file (replace 'example.com' with your own)

```
[http "https://example.com"]
    proxy = http://127.0.0.1:8888
```

## Same for .ssh/config (replace 'example.com' with your own)

```
Host example.com
  User git
  HostName example.com
  ProxyCommand nc -X connect -x 127.0.0.1:8888 %h %p
```


## Troubleshooting

```
tail -f ./logs/tinyproxy/tinyproxy.log
```

You might see `Unauthorized connection from "<docker-gateway-ip>"` (docker gateway)

This means your IP is not allowed to connect

You can add it to the config file tinyproxy.conf with `Allow <docker-gateway-ip>`