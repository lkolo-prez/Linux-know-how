Powyższe polecenia są komendami systemowymi, które służą do konfiguracji serwera Apache w celu utworzenia witryny internetowej. Oto krótki opis każdego polecenia:

1. Tworzenie katalogu public_html:

```bash
sudo mkdir -p /var/www/<web-domain>/public_html
```

Polecenie `mkdir` tworzy nowy katalog o nazwie `<web-domain>` w ścieżce `/var/www/`. Flagą `-p` upewnia się, że wszystkie nieistniejące katalogi w ścieżce są również tworzone.

2. Zmiana właściciela katalogu:

```bash
sudo chown -R $USER:$USER /var/www/<web-domain>/public_html
```

Polecenie `chown` zmienia właściciela i grupę dla określonego katalogu i wszystkich jego zawartości. `$USER` jest zmienną środowiskową, która przechowuje nazwę aktualnie zalogowanego użytkownika.

3. Zmiana uprawnień dla katalogu:

```bash
sudo chmod -R 755 /var/www
```

Polecenie `chmod` zmienia uprawnienia dostępu do plików i katalogów. Flagą `-R` oznacza rekursywne stosowanie zmian do wszystkich plików i katalogów wewnątrz `/var/www`. Liczba `755` określa uprawnienia, gdzie właściciel ma pełne prawa, a grupa i inni użytkownicy mają ograniczone prawa.

4. Tworzenie pliku index.html:

```bash
echo "index.html" >> /var/www/sqladmins.pl/public_html/index.html
```

Polecenie `echo` wypisuje tekst "index.html" i przekierowuje go do pliku `/var/www/sqladmins.pl/public_html/index.html`. Jeśli plik już istnieje, zostanie zastąpiony.

5. Zawartość pliku index.html:

```html
<html>
  <head>
    <title>Welcome to <web-domain></title>
  </head>
  <body>
    <h1>Success! The <web-domain> virtual host is working!</h1>
  </body>
</html>
```

Powyższy kod HTML to treść pliku index.html. `<web-domain>` jest zmienną, którą należy zastąpić właściwą nazwą domeny.

6. Kopiowanie pliku konfiguracyjnego Apache:

```bash
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/<web-domain>.conf
```

Polecenie `cp` kopiuje plik konfiguracyjny Apache `000-default.conf` do nowego pliku o nazwie `<web-domain>.conf` w tym samym katalogu.

7. Konfiguracja pliku <web-domain>.conf:

```
<VirtualHost *:80>
    ServerAdmin admin@<web-domain>
    ServerName <web-domain>
    ServerAlias www.<web-domain>
    DocumentRoot /var/www/<web-domain>/public_html
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

Powierzchnia kon

figuracyjna Apache zawiera ustawienia dla wirtualnego hosta `<web-domain>`. W tym przykładzie ustawiono go dla portu 80 (`*:80`). Należy zastąpić `<web-domain>` właściwą nazwą domeny.

8. Włączanie pliku konfiguracyjnego <web-domain>.conf:

```bash
sudo a2ensite <web-domain>.conf
```

Polecenie `a2ensite` włącza plik konfiguracyjny Apache dla danego wirtualnego hosta.

9. Wyłączanie pliku konfiguracyjnego 000-default.conf:

```bash
sudo a2dissite 000-default.conf
```

Polecenie `a2dissite` wyłącza plik konfiguracyjny Apache o nazwie 000-default.conf.

10. Restartowanie usługi Apache:

```bash
sudo systemctl restart apache2
```

Polecenie `systemctl restart` restartuje usługę Apache, aby wprowadzić zmiany w konfiguracji.

11. Sprawdzanie statusu usługi Apache:

```bash
sudo systemctl status apache2
```

Polecenie `systemctl status` wyświetla status usługi Apache, czy działa poprawnie.

12. Edycja pliku hosts:

```bash
sudo mcedit /etc/hosts
```

Polecenie `mcedit` otwiera edytor tekstowy (np. Midnight Commander) do edycji pliku `/etc/hosts`, który mapuje adresy IP na nazwy domenowe.

13. Zawartość pliku hosts:

```
127.0.0.1   localhost
127.0.1.1   guest-desktop
123.234.345.567 <web-domain>
```

Powyższe linie w pliku hosts mapują adresy IP na nazwy domenowe. `<web-domain>` należy zastąpić właściwą nazwą domeny, a `123.234.345.567` to przykładowy adres IP.

Pamiętaj, że w powyższych komendach należy dostosować `<web-domain>` do właściwej nazwy domeny, którą chcesz skonfigurować na swoim serwerze.
