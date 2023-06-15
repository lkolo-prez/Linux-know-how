Oczywiście, oto kilka dodatkowych informacji dotyczących przekierowań w serwerze Nginx:

## Przekierowanie na inny adres URL z zachowaniem ścieżki

Jeśli chcesz przekierować żądanie na inny adres URL, ale zachować oryginalną ścieżkę, można użyć dyrektywy `rewrite` z flagą `last`. Przykładowo, jeśli chcesz przekierować `http://example.com/old-path` na `http://example.com/new-path`, można zastosować następującą konfigurację:

```shell
server {
    listen 80;
    server_name example.com;
    
    location /old-path {
        rewrite ^/old-path(.*)$ /new-path$1 last;
    }
}
```

W tym przypadku, gdy żądanie zostanie wysłane do `http://example.com/old-path`, zostanie przekierowane na `http://example.com/new-path`, zachowując oryginalną ścieżkę `/old-path`.

## Przekierowanie domeny na inny port na tym samym serwerze

Jeśli chcesz przekierować żądanie z jednej domeny na inny port na tym samym serwerze, można zastosować dyrektywę `proxy_pass` i określić adres docelowy wraz z portem. Przykładowo, jeśli chcesz przekierować `http://example.com` na port 8080 na tym samym serwerze, można użyć następującej konfiguracji:

```shell
server {
    listen 80;
    server_name example.com;
    
    location / {
        proxy_pass http://localhost:8080;
    }
}
```

W tym przypadku, gdy żądanie zostanie wysłane do `http://example.com`, zostanie przekierowane na port 8080 na tym samym serwerze.

## Przekierowanie na inny protokół

Jeśli chcesz przekierować żądanie z jednego protokołu na inny (np. z HTTP na HTTPS), można zastosować odpowiednie dyrektywy i reguły. Przykładowo, jeśli chcesz przekierować `http://example.com` na `https://example.com`, można użyć następującej konfiguracji:

```shell
server {
    listen 80;
    server_name example.com;
    
    location / {
        return 301 https://$host$request_uri;
    }
}
```

W tym przypadku, gdy żądanie zostanie wysłane do `http://example.com`, zostanie przekierowane na `https://example.com`.

## Przekierowanie na inny adres URL z uwzględnieniem parametrów

Jeśli chcesz przekierować żądanie na inny adres URL i uwzględnić przekazane parametry, można użyć zmiennej `$args`. Przykładowo, jeśli chcesz przekierować `http://example.com/?param1=value1&param2=value2` na `http://newdomain.com/?param1=value1&param2=value2`, można zastosować następującą konfigurację:

```shell
server {
    listen 80;
    server_name example.com;
    
    location / {
        return 301

 http://newdomain.com/$uri$is_args$args;
    }
}
```

W tym przypadku, gdy żądanie zostanie wysłane do `http://example.com/?param1=value1&param2=value2`, zostanie przekierowane na `http://newdomain.com/?param1=value1&param2=value2`.

Pamiętaj, że po wprowadzeniu zmian w konfiguracji Nginx konieczne jest przetestowanie i przeładowanie konfiguracji, jak wcześniej opisałem.
