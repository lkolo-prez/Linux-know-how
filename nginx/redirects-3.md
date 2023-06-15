Oczywiście, oto kilka kolejnych przykładów dotyczących przekierowań w serwerze Nginx:

## Przekierowanie na inny serwer

Jeśli chcesz przekierować żądanie na inny serwer, możesz użyć dyrektywy `proxy_pass` i określić adres docelowy. Przykładowo, jeśli chcesz przekierować `http://example.com` na `http://backend-server`, można użyć następującej konfiguracji:

```shell
server {
    listen 80;
    server_name example.com;

    location / {
        proxy_pass http://backend-server;
    }
}
```

W tym przypadku, gdy żądanie zostanie wysłane do `http://example.com`, zostanie przekierowane na `http://backend-server`.

## Przekierowanie na inny serwer na innym porcie

Jeśli chcesz przekierować żądanie na inny serwer na innym porcie, możesz również użyć dyrektywy `proxy_pass` i określić odpowiedni adres docelowy wraz z portem. Przykładowo, jeśli chcesz przekierować `http://example.com` na `http://backend-server:8080`, można zastosować następującą konfigurację:

```shell
server {
    listen 80;
    server_name example.com;

    location / {
        proxy_pass http://backend-server:8080;
    }
}
```

W tym przypadku, gdy żądanie zostanie wysłane do `http://example.com`, zostanie przekierowane na `http://backend-server:8080`.

## Przekierowanie na inny serwer z uwzględnieniem nagłówków

Jeśli chcesz przekierować żądanie na inny serwer, zachowując jednocześnie oryginalne nagłówki, można użyć dyrektywy `proxy_pass` wraz z dyrektywami `proxy_set_header`. Przykładowo, jeśli chcesz przekierować `http://example.com` na `http://backend-server` i zachować oryginalne nagłówki, można zastosować następującą konfigurację:

```shell
server {
    listen 80;
    server_name example.com;

    location / {
        proxy_pass http://backend-server;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
```

W tym przypadku, gdy żądanie zostanie wysłane do `http://example.com`, zostanie przekierowane na `http://backend-server`, a oryginalne nagłówki będą zachowane.

Mam nadzieję, że te przykłady przekierowań w serwerze Nginx są pomocne. Jeśli masz jakieś dodatkowe pytania, chętnie na nie odpowiem.
