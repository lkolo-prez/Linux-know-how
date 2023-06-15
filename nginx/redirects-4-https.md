Oczywiście, oto kilka dodatkowych przykładów dotyczących konfiguracji serwera Nginx:

## Blokowanie dostępu do katalogu

Jeśli chcesz zablokować dostęp do konkretnego katalogu, możesz użyć dyrektywy `deny`. Przykładowo, jeśli chcesz zablokować dostęp do katalogu `/private`, można zastosować następującą konfigurację:

```shell
location /private {
    deny all;
}
```

W tym przypadku, jeśli użytkownik spróbuje uzyskać dostęp do katalogu `/private`, otrzyma błąd 403 Forbidden.

## Przekierowanie z HTTP na HTTPS

Jeśli chcesz przekierować żądania z protokołu HTTP na HTTPS, możesz użyć dyrektywy `return` w połączeniu z kodem przekierowania 301. Przykładowo:

```shell
server {
    listen 80;
    server_name example.com;

    return 301 https://$server_name$request_uri;
}
```

W tym przypadku, gdy żądanie zostanie wysłane do `http://example.com`, użytkownik zostanie automatycznie przekierowany na `https://example.com` przy użyciu kodu odpowiedzi 301 Moved Permanently.

## Skonfigurowanie kompresji Gzip

Aby skompresować odpowiedzi serwera za pomocą Gzip i przyspieszyć transfer danych, można skorzystać z dyrektyw `gzip`. Przykładowo:

```shell
gzip on;
gzip_types text/plain text/css application/json;
```

W tym przypadku, serwer Nginx będzie kompresował odpowiedzi w formacie tekstowym, arkusze stylów CSS oraz dane w formacie JSON.

## Konfiguracja blokowania botów i adresów IP

Jeśli chcesz zablokować dostęp do Twojego serwera dla konkretnych botów lub adresów IP, można skorzystać z dyrektyw `map` i `deny`. Przykładowo:

```shell
map $http_user_agent $bad_bot {
    default 0;
    ~*bot 1;
}

map $remote_addr $bad_ip {
    default 0;
    123.123.123.123 1;
}

server {
    ...

    if ($bad_bot) {
        return 403;
    }

    location / {
        deny $bad_ip;
        ...
    }
}
```

W tym przypadku, żądania od botów lub z określonego adresu IP zostaną zablokowane, a użytkownik otrzyma błąd 403 Forbidden.

To są tylko niektóre z przykładów konfiguracji serwera Nginx. Istnieje wiele innych możliwości i funkcji, które można dostosować do swoich potrzeb. Jeśli masz jakieś konkretne wymagania lub pytania, chętnie na nie odpowiem.
