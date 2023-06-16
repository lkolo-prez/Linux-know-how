

## Instalacja Ansible

Ansible jest dostępny w domyślnych repozytoriach większości dystrybucji Linux, więc instalacja jest dość prosta.

### Ubuntu/Debian

```shell
sudo apt-get update
sudo apt-get install ansible
```

### CentOS/RHEL

```shell
sudo yum install epel-release
sudo yum install ansible
```

## *Przed konfiguracją*

---

## Generowanie klucza prywatnego SSH

1. Otwórz terminal.

2. Wykonaj polecenie `ssh-keygen`:

```shell
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
Ta komenda wygeneruje klucz RSA o długości 4096 bitów. `-C` pozwala dodać komentarz do klucza, zazwyczaj używa się do tego adresu e-mail.

3. Po wykonaniu polecenia, zostaniesz poproszony o podanie ścieżki do pliku, w którym ma być zapisany klucz. Jeśli chcesz użyć domyślnej ścieżki (zalecane), po prostu naciśnij Enter:

```shell
Enter a file in which to save the key (/home/your_username/.ssh/id_rsa): [Press enter]
```

4. Następnie zostaniesz poproszony o wprowadzenie hasła do klucza. Wprowadź silne hasło i naciśnij Enter, a następnie wprowadź je ponownie, gdy zostaniesz poproszony o potwierdzenie:

```shell
Enter passphrase (empty for no passphrase): [Type a passphrase]
Enter same passphrase again: [Type passphrase again]
```

5. Po zakończeniu procesu generowania klucza, powinieneś zobaczyć wiadomość podobną do tej:

```shell
Your identification has been saved in /home/your_username/.ssh/id_rsa.
Your public key has been saved in /home/your_username/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:your_generated_key_fingerprint your_email@example.com
The key's randomart image is:
+---[RSA 4096]----+
|      ..o        |
|   .  o.+ .      |
|    +.+ .+       |
|   . =.= +       |
|    .o .S.       |
|     .+o.        |
|    .o. .        |
|   .+. . .       |
|   .... .        |
+----[SHA256]-----+
```

Twoje klucze SSH są teraz wygenerowane! Klucz prywatny (`id_rsa`) jest zapisany w katalogu `~/.ssh/` na twoim serwerze. Klucz publiczny (`id_rsa.pub`) jest używany do dodawania do serwerów, na które chcesz się łączyć.

---

Pamiętaj, żeby nigdy nie udostępniać swojego klucza prywatnego! Jest on jak hasło i powinien być trzymany w bezpiecznym miejscu.


## Konfiguracja Ansible

Pierwszym krokiem w konfiguracji Ansible jest utworzenie pliku konfiguracyjnego. Możesz utworzyć globalny plik konfiguracyjny `/etc/ansible/ansible.cfg` lub lokalny plik konfiguracyjny w katalogu, z którego uruchamiasz Ansible.

Przykładowy plik konfiguracyjny może wyglądać tak:

```ini
[defaults]
inventory = /path/to/your/inventory
remote_user = your_user
private_key_file = /path/to/your/key.pem
host_key_checking = False
```

---

## Plik inwentarza Ansible
Plik inwentarza w Ansible to dokument, który definiuje hosty i grupy hostów. Pliki inwentarza mogą być w formacie INI, YAML, a nawet mogą być skryptami dynamicznymi. Poniżej znajduje się przykład opisu pliku inwentarza Ansible w formacie Markdown:

### Format INI

Plik inwentarza w formacie INI definiuje grupy hostów za pomocą sekcji. Przykładowo:

```ini
[webservers]
server1.example.com
server2.example.com

[dbservers]
db1.example.com
db2.example.com
```

W powyższym przykładzie, mamy dwie grupy: `webservers` i `dbservers`. Każda grupa zawiera listę hostów należących do tej grupy.

### Format YAML

Plik inwentarza w formacie YAML ma podobną strukturę, ale zapisany jest w formacie YAML. Przykładowo:

```yaml
all:
  children:
    webservers:
      hosts:
        server1.example.com:
        server2.example.com:

    dbservers:
      hosts:
        db1.example.com:
        db2.example.com:
```

W powyższym przykładzie, mamy również dwie grupy: `webservers` i `dbservers`. Każda grupa zawiera listę hostów należących do tej grupy.

### Skrypty dynamiczne

Plik inwentarza może być również skryptem dynamicznym, który generuje listę hostów na podstawie zewnętrznego źródła danych, takiego jak baza danych lub API usługi chmurowej. Skrypty te muszą zwracać dane w formacie JSON.

---

Pamiętaj, że w Ansible możesz definiować zmienne na poziomie hosta lub grupy, co pozwala na dostosowanie konfiguracji dla różnych hostów lub grup hostów. Możesz również użyć wielu plików inwentarza naraz, co jest szczególnie przydatne w dużych środowiskach z wieloma grupami hostów.
```

## Uruchomienie playbooka Ansible

Możesz uruchomić playbooka Ansible przy użyciu polecenia `ansible-playbook`. Na przykład:

```shell
ansible-playbook your_playbook.yml
```

---
