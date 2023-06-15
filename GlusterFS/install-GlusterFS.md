
1. Instalacja wymaganych pakietów:

   ```bash
   yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
   yum install -y centos-release-gluster
   yum install -y glusterfs-server
   ```

2. Uruchomienie usługi glusterd:

   ```bash
   systemctl start glusterd
   ```

3. Zatrzymanie usługi glusterd:

   ```bash
   systemctl stop glusterd
   ```

4. Wyłączenie usługi glusterd, aby była wyłączona po ponownym uruchomieniu systemu:

   ```bash
   systemctl disable glusterd
   ```

5. Zatrzymanie i wyłączenie usługi firewalld:

   ```bash
   systemctl stop firewalld
   systemctl disable firewalld
   ```

6. Sprawdzenie statusu usługi glusterd:

   ```bash
   systemctl status glusterd
   ```

7. Montowanie zasobu GlusterFS:

   ```bash
   mount.glusterfs 10.241.0.16:/wwwdata /volume/wwwdata
   mount.glusterfs 10.241.0.16:/vsftpdata /volume/vsftpdata
   ```

8. Podłączanie nowego węzła (noda) do klastra:

   ```bash
   gluster peer probe 10.241.0.12
   ```

9. Odłączanie węzła (noda) od klastra:

   ```bash
   gluster peer detach 10.241.0.X
   ```

   Zamiast `10.241.0.X` należy podać adres IP węzła, który ma zostać odłączony.

10. Sprawdzanie statusu połączenia między węzłami:

    ```bash
    gluster peer status
    ```

11. Sprawdzanie listy węzłów w klastrze:

    ```bash
    gluster pool list
    ```

12. Sprawdzanie listy dostępnych woluminów (dysków sieciowych) w klastrze:

    ```bash
    gluster volume list
    ```

13. Sprawdzanie statusu dysków w klastrze:

    ```bash
    gluster volume status
    ```

14. Dodawanie węzła (noda) do woluminu:

    ```bash
    gluster volume add-brick wwwdata replica 5 10.241.0.17:/data/glusterfs2/wwwdata
    ```

    Zamiast `10.241.0.17:/data/glusterfs2/wwwdata` należy podać adres IP i ścieżkę do miejsca, w którym znajduje się dysk węzła.

15. Usuwanie węzła (noda) z woluminu:

    ```bash
    gluster volume remove-brick wwwdata replica 3 10.241.0.17:/data/glusterfs2/wwwdata
    ```

    Zamiast `10.241.0.17:/data/glusterfs2/wwwdata` należy podać adres IP i ścieżkę do miejsca, z

 którego ma zostać usunięty dysk węzła.

16. Tworzenie aliasu (linku symbolicznego) do katalogu:

    ```bash
    ln -s /data/glusterfs/api /volume/api
    ```

    Zamiast `/data/glusterfs/api` należy podać ścieżkę docelowego miejsca, a `/volume/api` będzie aliasem, który będzie prowadził do tego miejsca.

Pamiętaj, że powyższe instrukcje są przykładami i należy dostosować je do własnych potrzeb, uwzględniając odpowiednie adresy IP, ścieżki i konfigurację klastra GlusterFS.
