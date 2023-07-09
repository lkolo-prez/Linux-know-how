#!/bin/bash

# Odczytaj zmienne z pliku ze zmiennymi
source variables.sh

# Zmień ustawienia sieciowe na podane w zmiennych
sudo nmcli connection modify "Wired Connection" ipv4.addresses $IP_ADDRESS
sudo nmcli connection modify "Wired Connection" ipv4.gateway $GATEWAY
sudo nmcli connection modify "Wired Connection" ipv4.dns "$DNS_SERVERS"
sudo nmcli connection modify "Wired Connection" ipv4.method manual

# Wyświetl aktualne ustawienia sieciowe
echo "Aktualne ustawienia sieciowe:"
nmcli connection show "Wired Connection"

# Zakończenie skryptu
echo "Konfiguracja sieciowa została zaktualizowana."

# Zmień hostname na wartość podaną w zmiennej
sudo sed -i "s/^hostname .*/hostname $HOSTNAME/" /etc/hostname

# Instaluj programy mc, htop i lynx
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y mc htop lynx

# Zmień port SSH na wartość podaną w zmiennej
sudo sed -i "s/^Port .*/Port $SSH_PORT/" /etc/ssh/sshd_config

# Zmień hasło roota na wartość podaną w zmiennej
echo "root:$ROOT_PASSWORD" | sudo chpasswd

# Utwórz użytkownika "user2" z podanym hasłem i katalogiem domowym
sudo useradd -m -s /bin/bash -p "$(openssl passwd -1 $USER2_PASSWORD)" -d /home/user2 user2

# Zakończenie skryptu
echo "Konfiguracja zakończona pomyślnie."
