# OpenFortiVpn in Docker

This runs openfortivpn in docker and exposes an http proxy

## Usage

Put your configurations inside config dir (copy and fill secrets)

```bash
cp config/openfortivpn.config.example config/openfortivpn.config
cp config/tinyproxy.conf.example config/tinyproxy.conf
```

Edit and add to your '.gitconfig' file (replace 'example.com' with your own)

```bash
[http "https://example.com"]
    proxy = http://127.0.0.1:8888
```

Same for .ssh/config (replace 'example.com' with your own)

```bash
Host example.com
  User git
  HostName example.com
  ProxyCommand nc -X connect -x 127.0.0.1:8888 %h %p
```


Run

```bash
docker compose up -d
```

Then you can use `git` and `ssh`

## Troubleshooting

```bash
docker compose exec forti tail -f -n0 /var/log/tinyproxy/tinyproxy.log
```

You might see `Unauthorized connection from "<docker-gateway-ip>"` (docker gateway)

This means your IP is not allowed to connect

You can add it to the config file `config/tinyproxy.conf` with `Allow <docker-gateway-ip>`