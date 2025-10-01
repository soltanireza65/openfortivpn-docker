## Usage

```bash
cp config.example config
```

```bash
touch ssh/authorized_keys
```

```bash
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
