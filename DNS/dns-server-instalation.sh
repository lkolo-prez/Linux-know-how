#!/bin/bash

# Install BIND9 and DNSutils
sudo apt install bind9 dnsutils -y

# Configure named.conf.options
sudo bash -c "echo 'forwarders { 8.8.8.8; 8.8.4.4; };' >> /etc/bind/named.conf.options"

# Restart BIND9 service
sudo systemctl restart bind9.service

# Configure named.conf.local
sudo bash -c "echo 'zone \"kolodziej.local\" {
    type master;
    file \"/etc/bind/kolodziej.local\";
};' >> /etc/bind/named.conf.local"

# Configure kolodziej.local zone file
sudo bash -c "echo ';
; BIND data file for kolodziej.local
;
\$TTL    604800
@       IN      SOA     kolodziej.local. root.kolodziej.local. (
                        04072023        ; Serial
                        604800          ; Refresh
                        86400           ; Retry
                        2419200         ; Expire
                        604800 )        ; Negative Cache TTL

@       IN      NS      ns.kolodziej.local.
@       IN      A       10.73.0.4
@       IN      AAAA    ::1
ns      IN      A       10.73.0.4
wp1     IN      A       10.82.0.11
test1   IN      A       10.82.0.11
stron   IN      A       10.82.0.11' >> /etc/bind/kolodziej.local"

# Restart BIND9 service
sudo systemctl restart bind9.service
