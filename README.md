## Usage

### Add config file with respective credentials

```bash
cp config.example config
```

### Add your public key

```bash
touch ssh/authorized_keys
```

```bash
docker compose up -d
```

### Edit and add to your '.gitconfig' file

```
[http "https://git.daal.plus"]
    proxy = socks5h://127.0.0.1:8080
```

### Same for .ssh/config

```
Host git.daal.plus
  User git
  IdentityFile ~/.ssh/id_rsa
  ProxyCommand nc -x 127.0.0.1:8080 -X 5 %h %p
```
