## Usage

1. Provide a `config` file based on `config.example`.
2. Add a public key into `authorized_keys`, if you plan to proxy SSH connections to a VPN

```
docker compose up -d
```

## .gitconfig

```
[http "https://git.daal.plus"]
    proxy = socks5h://127.0.0.1:8080
```

## .ssh/config

```
Host git.daal.plus
  User git
  IdentityFile ~/.ssh/id_rsa
  ProxyCommand nc -x 127.0.0.1:8080 -X 5 %h %p
```
