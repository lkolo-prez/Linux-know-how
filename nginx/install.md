## Wysyłanie klucza SSH na wskazany serwer

```shell
ssh-copy-id root@1.2.3.4
```

Polecenie `ssh-copy-id` służy do wysyłania klucza publicznego SSH na wskazany serwer. W powyższym przykładzie, klucz publiczny zostanie skopiowany na serwer o adresie IP 1.2.3.4. Jeśli posiadamy więcej niż jeden klucz, możemy użyć dodatkowego parametru `-i`, aby wskazać konkretny klucz do przesłania.

```shell
ssh-copy-id -i ~/.ssh/id_rsa root@1.2.3.4
```

Polecenie `ssh-copy-id` dodaje nasz klucz publiczny do pliku `.ssh/authorized_keys` w folderze domowym użytkownika, do którego się logujemy na serwerze. Możemy również dodać klucz ręcznie do tego pliku. Jeśli plik nie istnieje, możemy go utworzyć wraz z odpowiednim folderem nadrzędnym `.ssh`, jeśli ten także nie istnieje.

## Aktualizacja listy pakietów (w przypadku serwerów opartych na Ubuntu/Debianie)

```shell
apt update
apt upgrade
```

Powyższe polecenia służą do aktualizacji listy pakietów na serwerach opartych na systemach Ubuntu/Debian. Polecenie `apt update` pobiera najnowszą listę dostępnych pakietów, a `apt upgrade` aktualizuje zainstalowane pakiety do najnowszych wersji.

Dla dystrybucji bazujących na CentOS/RedHat, odpowiednie polecenia to:

```shell
yum update
yum upgrade
```

## Instalacja

Sprawdzenie dostępnych pakietów związanych z serwerem Nginx:

```shell
apt search nginx | grep nginx
```

Powyższe polecenie wyświetla listę pakietów zawierających słowo "nginx". Możemy użyć polecenia `grep` do filtrowania wyników.

Instalacja pakietu `nginx-extras`:

```shell
apt install nginx-extras
```

Polecenie `apt install` służy do instalacji pakietów. W tym przypadku instalujemy pakiet `nginx-extras`, który zawiera rozszerzenia dla serwera Nginx. Możemy zmienić nazwę pakietu na inny, jeśli chcemy zainstalować inną wersję lub konkretny zestaw modułów.

Sprawdzenie, czy serwer Nginx działa poprawnie:

```shell
netstat -plntu
```

Polecenie `netstat` jest narzędziem do wyświetlania informacji o sieci, a opcje `-plntu` filtrują wyniki, pokazując tylko gniazda nasłuchujące na portach TCP i UDP.
