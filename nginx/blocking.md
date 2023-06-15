Oczywiście! Oto kilka dodatkowych przykładów dotyczących konfiguracji serwera Nginx:

## Blokowanie dostępu do plików

Jeśli chcesz zablokować dostęp do określonych plików, możesz skorzystać z dyrektywy `location` w połączeniu z dyrektywą `deny`. Przykładowo, jeśli chcesz zablokować dostęp do plików o rozszerzeniach `.txt` i `.log`, można użyć następującej konfiguracji:

```shell
location ~* \.(txt|log)$ {
    deny all;
}
```

W tym przypadku, jeśli użytkownik spróbuje uzyskać dostęp do plików o rozszerzeniach `.txt` lub `.log`, otrzyma błąd 403 Forbidden.

## Przekierowanie na inną lokalizację

Jeśli chcesz przekierować żądania na inną lokalizację, można użyć dyrektywy `rewrite`. Przykładowo, jeśli chcesz przekierować wszystkie żądania dla `/old-url` na `/new-url`, można zastosować następującą konfigurację:

```shell
location /old-url {
    rewrite ^/old-url(.*)$ /new-url$1 permanent;
}
```

W tym przypadku, gdy użytkownik spróbuje uzyskać dostęp do `/old-url`, zostanie automatycznie przekierowany na `/new-url` z użyciem kodu przekierowania 301.

## Skonfigurowanie serwowania plików statycznych

Aby skonfigurować serwer Nginx do serwowania plików statycznych, można użyć dyrektywy `root`. Przykładowo, jeśli pliki statyczne znajdują się w katalogu `/var/www/html`, można zastosować następującą konfigurację:

```shell
server {
    ...
    root /var/www/html;
    ...
}
```

W tym przypadku, Nginx będzie serwował pliki statyczne z katalogu `/var/www/html` w odpowiedzi na żądania.

## Skonfigurowanie uwierzytelniania HTTP Basic

Jeśli chcesz wymagać uwierzytelnienia HTTP Basic przed udostępnieniem zasobów, można użyć dyrektyw `auth_basic` i `auth_basic_user_file`. Przykładowo:

```shell
location /private {
    auth_basic "Restricted Content";
    auth_basic_user_file /etc/nginx/.htpasswd;
}
```

W tym przypadku, użytkownik będzie musiał podać prawidłowe dane uwierzytelniające przed uzyskaniem dostępu do lokalizacji `/private`. Pliki z danymi uwierzytelniającymi można utworzyć za pomocą narzędzia `htpasswd`.

To są tylko niektóre z przykładów konfiguracji serwera Nginx. Istnieje wiele innych opcji i funkcji, które można dostosować do swoich potrzeb. Jeśli masz jakiekolwiek pytania lub potrzebujesz dalszej pomocy, jestem

 tutaj, aby pomóc!
