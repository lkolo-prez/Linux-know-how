## Konfiguracja domeny

Aby skonfigurować domenę, należy ustawić rekord A domeny, który będzie wskazywał na adres IP naszego serwera.

## Hostowanie 2 stron www

Konfiguracja serwera Nginx znajduje się w lokalizacji `/etc/nginx/`. W katalogu `/etc/nginx/sites-enabled` znajdują się aktywne strony, a w katalogu `/etc/nginx/sites-available` znajdują się dostępne do aktywacji strony.

Poniżej przedstawiony jest przykład definicji serwera:

```shell
server {
    listen 80;
    listen [::]:80;

    root /var/www/domyslna;

    index index.html index.htm;
    server_name _;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

- `listen 80` - serwer nasłuchuje na porcie 80 dla IPv4.
- `listen [::]:80` - serwer nasłuchuje na porcie 80 dla IPv6.
- `root /var/www/domyslna` - wskazuje lokalizację, z której ładowana będzie strona internetowa.
- `index index.html index.htm` - definiuje pliki indeksowe, które będą przeszukiwane kaskadowo. Jeśli pierwszy plik nie zostanie znaleziony, serwer przejdzie do kolejnego.
- `server_name _;` - określa nazwę serwera. Podkreślenie oznacza serwer domyślny, który akceptuje wszystkie domeny.
- `location /` - blok przechwytujący żądania dla konkretnej lokalizacji.

Aby obsłużyć drugą stronę WWW, należy utworzyć plik konfiguracyjny (np. `/etc/nginx/sites-available/druga`) o następującej treści:

```shell
server {
    listen 80;
    listen [::]:80;
    
    root /var/www/druga;
    index index.html index.htm;
    server_name sub2.hehel.xyz;
}
```

Aby aktywować drugą stronę, należy utworzyć symboliczny link w katalogu `sites-enabled`:

```shell
cd /etc/nginx/sites-enabled/
ln -s ../sites-available/druga
```

Aby sprawdzić poprawność konfiguracji:

```shell
nginx -t
```

Aby załadować nową konfigurację (o ile nie ma błędów):

```shell
nginx -s reload
```

## Własne komunikaty błędów

Aby skonfigurować własne komunikaty błędów, można dodać sekcję `error_page` do pliku konfiguracyjnego. Na przykład, w pliku `/etc/nginx/sites-enabled/druga`, można dodać:

```shell
server_name sub2.hehel.xyz  sub3.hehel.xyz;

error_page 404 /error404.html;
```

Następnie można sprawdzić konfigurację:

```shell
nginx -t
nginx -s reload
```

W efekcie, po wystąpieniu błędu 404, użytkownik zostanie przekierowany na stronę `/error404.html` zdefiniowaną

 w lokalizacji `/var/www/druga`.
