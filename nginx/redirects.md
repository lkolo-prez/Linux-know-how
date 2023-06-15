## Skonfigurowanie przekierowań

Aby skonfigurować przekierowania w serwerze Nginx, można użyć dyrektywy `rewrite`. Przykładowo, jeśli chcemy przekierować żądanie z `http://example.com` na `https://www.example.com`, można dodać następującą konfigurację do pliku odpowiedzialnego za stronę `example.com`:

```shell
server {
    listen 80;
    server_name example.com;
    return 301 https://www.example.com$request_uri;
}
```

Następnie należy sprawdzić konfigurację:

```shell
nginx -t
```

Aby załadować nową konfigurację:

```shell
nginx -s reload
```

W ten sposób żądanie wysłane do `http://example.com` zostanie przekierowane na `https://www.example.com`.

## Skonfigurowanie przekierowań domeny na inny adres URL

Aby przekierować domenę na inny adres URL, można zastosować podobną konfigurację. Przykładowo, jeśli chcemy przekierować `http://example.com` na `https://www.innyadres.com`, można użyć następującej konfiguracji:

```shell
server {
    listen 80;
    server_name example.com;
    return 301 https://www.innyadres.com$request_uri;
}
```

Następnie należy sprawdzić konfigurację:

```shell
nginx -t
```

Aby załadować nową konfigurację:

```shell
nginx -s reload
```

W ten sposób żądanie wysłane do `http://example.com` zostanie przekierowane na `https://www.innyadres.com`.

## Przekierowanie na inny port

Aby przekierować żądanie na inny port, można użyć dyrektywy `proxy_pass`. Przykładowo, jeśli chcemy przekierować żądanie z `http://example.com` na port 8080, można zastosować następującą konfigurację:

```shell
server {
    listen 80;
    server_name example.com;
    
    location / {
        proxy_pass http://localhost:8080;
    }
}
```

Następnie należy sprawdzić konfigurację:

```shell
nginx -t
```

Aby załadować nową konfigurację:

```shell
nginx -s reload
```

W ten sposób żądanie wysłane do `http://example.com` zostanie przekierowane na port 8080 na tym samym serwerze.

## Przekierowanie na inny serwer

Aby przekierować żądanie na inny serwer, można również użyć dyrektywy `proxy_pass`. Przykładowo, jeśli chcemy przekierować żądanie z `http://example.com` na inny serwer o adresie IP 192.168.1.100, można zastosować następującą konfigurację:

```shell
server {
    listen 80;
    server_name example.com;
    
    location / {
        proxy_pass http://192.168.1.100;
    }
}
```

Następnie

 należy sprawdzić konfigurację:

```shell
nginx -t
```

Aby załadować nową konfigurację:

```shell
nginx -s reload
```

W ten sposób żądanie wysłane do `http://example.com` zostanie przekierowane na serwer o adresie IP 192.168.1.100.
