
1. Install BIND9 and DNSutils:

   ```shell
   sudo apt install bind9 dnsutils
   ```

2. Configure `/etc/bind/named.conf.options`:

   ```plaintext
   forwarders {
       8.8.8.8;
       8.8.4.4;
   };
   ```

3. Restart BIND9 service:

   ```shell
   sudo systemctl restart bind9.service
   ```

4. Configure `/etc/bind/named.conf.local`:

   ```plaintext
   zone "kolodziej.local" {
       type master;
       file "/etc/bind/kolodziej.local";
   };
   ```

5. Configure `/etc/bind/kolodziej.local` zone file:

   ```plaintext
   ;
   ; BIND data file for kolodziej.local
   ;
   $TTL    604800
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
   stron   IN      A       10.82.0.11
   ```

6. Restart BIND9 service:

   ```shell
   sudo systemctl restart bind9.service
   ```
```

