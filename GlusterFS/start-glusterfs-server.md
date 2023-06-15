
Na węzłach 1, 2, 3, 6, 7, 8 wykonaj następujące kroki:

1. Uruchomienie i włączenie usługi glusterd:

   ```bash
   systemctl start glusterd
   systemctl enable glusterd
   ```

Na węźle 1 wykonaj następujące kroki:

2. Dodanie węzłów do klastra Gluster:

   ```bash
   gluster peer probe 10.241.0.11
   gluster peer probe 10.241.0.12
   gluster peer probe 10.241.0.13
   gluster peer probe 10.241.0.16
   gluster peer probe 10.241.0.17
   gluster peer probe 10.241.0.18
   ```

3. Utworzenie woluminu (dysku) "wwwdata" typu replica z 3 kopiami i 1 arbitrem:

   ```bash
   gluster volume create wwwdata replica 3 arbiter 1 10.241.0.11:/DATA/gluster-wwwdata 10.241.0.12:/DATA/gluster-wwwdata 10.241.0.13:/DATA/gluster-wwwdata force
   ```

4. Utworzenie woluminu (dysku) "vsftpdata" typu replica z 3 kopiami i 1 arbitrem:

   ```bash
   gluster volume create vsftpdata replica 3 arbiter 1 10.241.0.11:/DATA/gluster-vsftpdata 10.241.0.12:/DATA/gluster-vsftpdata 10.241.0.13:/DATA/gluster-vsftpdata force
   ```

5. Sprawdzenie informacji o woluminie "wwwdata":

   ```bash
   gluster volume info wwwdata
   ```

6. Sprawdzenie informacji o woluminie "vsftpdata":

   ```bash
   gluster volume info vsftpdata
   ```

7. Uruchomienie woluminów "wwwdata" i "vsftpdata":

   ```bash
   gluster volume start wwwdata
   gluster volume start vsftpdata
   ```

8. Samoleczenie dysków w przypadku problemów (np. po restarcie):

   ```bash
   gluster volume heal wwwdata full
   gluster volume heal vsftpdata full
   ```

9. Sprawdzenie informacji o naprawie (healu) woluminu "wwwdata":

   ```bash
   gluster volume heal wwwdata info
   ```

10. Sprawdzenie statystyk dotyczących naprawy woluminu "wwwdata":

    ```bash
    gluster volume heal wwwdata statistics
    ```

11. Sprawdzenie liczby napraw woluminu "wwwdata":

    ```bash
    gluster volume heal wwwdata statistics heal-count
    ```

Pamiętaj, że powyższe instrukcje należy dostosować do swojego środowiska, uwzględniając odpowiednie adresy IP, ścieżki do katalogów i konfigurację klastra GlusterFS.
