---

## Konfiguracja domeny

Rekord A domeny musi wskazywać na adres IP naszego serwera.

## Hostowanie 2 stron WWW

Konfiguracja Nginx znajduje się w lokalizacji `/etc/nginx/`.

### Definicja serwera

```shell
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    root /var/www/domyslna;
    index index.html index.htm;
    server_name _;
        
    location / {
        try_files $uri $uri/ =404;
    }
}
```

Objaśnienie poszczególnych linii:

- `listen 80` - nasłuchuje na porcie 80 dla IPv4
- `listen [::]:80` - nasłuchuje na porcie 80 dla IPv6
- `default_server` - parametr, który sprawia, że jeżeli Nginx nie wie, który serwer ma uruchomić, wybierze ten
- `root` - wskazuje, z którego miejsca będzie ładowana strona internetowa
- `index` - dyrektywa określająca, który plik będzie indexem (plikiem startowym) w tym katalogu. Przeszukiwanie plików jest kaskadowe. Jeżeli znajdzie pierwszy, to kończy pracę; jeśli go nie znajdzie, przechodzi do kolejnego.
- `server_name _;` - określa nazwę twojej domeny. Podkreślenie oznacza serwer domyślny, czyli wszystkie domeny są akceptowane.
- `location /` - blok chwytający żądania dla konkretnej lokalizacji

### Obsługa drugiej strony WWW (plik `/etc/nginx/sites-available/druga`)

```shell
server {
    listen 80;
    listen [::]:80;
    root /var/www/druga;
    index index.html index.htm;
    server_name sub2.hehel.xyz;
}
```

Aktywacja drugiej strony (z pliku 'druga')

```shell
cd /etc/nginx/sites-enabled/
ln -s ../sites-available/druga
```

Sprawdzenie poprawności konfiguracji

```shell
nginx -t
```

Załadowanie nowej konfiguracji (o ile powyższe polecenie nie zwróciło błędów)

```shell
nginx -s reload
```

### Własne komunikaty błędów

```shell
cd /etc/nginx/sites-enabled/
vim druga
```

W pliku konfiguracyjnym:

```shell
server_name sub2.hehel.xyz  sub3.hehel.xyz;

error_page 404 /error404.html;
```

Na koniec:

```shell
nginx -t 
nginx -s reload
```

Aktywacja listowania plików w podkatalogu (fragment `/etc/nginx/sites-enabled/druga`)

```shell
location /pliki {
    fancyindex on;
}
```

### Strona tylko dla wybranych (na podstawie IP)

To sprawi, że do katalogu 'pliki' może wejść tylko jeden,

 wybrany IP:

```shell
location /pliki {
    allow 192.168.1.1;
    deny all;
}
```

Zezwól na dostęp wszystkim poza podanym IP:

```shell
location /pliki {
    deny 192.168.1.1;
    allow all;
}
```
