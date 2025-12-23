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
[http "https://git.daal.plus"]
    proxy = http://127.0.0.1:8888
```

## Same for .ssh/config

```
Host git.daal.plus
  User git
  HostName example.com
  ProxyCommand nc -X connect -x 127.0.0.1:8888 %h %p
```


## Trobleshooting

```
tail -f ./logs/tinyproxy/tinyproxy.log
```

You might see `Unauthorized connection from "192.168.97.1"` (docker gateway)

This means your IP is not allowed to connect

You can add it to the config file tinyproxy.conf with `Allow 192.168.97.1`
