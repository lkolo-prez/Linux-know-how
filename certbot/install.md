
1. Instalacja narzędzia Certbot i modułu Nginx:

   ```bash
   sudo apt-get install python3-certbot-nginx
   ```

2. Instalacja niezbędnych paczek dla narzędzia Certbot poprzez Snap:

   ```bash
   sudo snap install core; sudo snap refresh core
   sudo snap install --classic certbot
   sudo ln -s /snap/bin/certbot /usr/bin/certbot
   ```

3. Wygenerowanie certyfikatu SSL dla serwera Nginx:

   ```bash
   sudo certbot --nginx
   ```

   To polecenie rozpocznie proces interaktywnego uzyskiwania certyfikatu SSL za pośrednictwem narzędzia Certbot. Narzędzie automatycznie wykryje serwer Nginx i zaproponuje skonfigurowanie certyfikatu dla istniejących witryn. Należy postępować zgodnie z instrukcjami, aby potwierdzić domenę i uzyskać certyfikat SSL.

   Po zakończeniu procesu certyfikat SSL zostanie zainstalowany i skonfigurowany w serwerze Nginx, umożliwiając korzystanie z szyfrowanego połączenia HTTPS.

   Uwaga: Upewnij się, że twoje domeny są skonfigurowane poprawnie i wskazują na właściwe adresy IP serwera przed uruchomieniem powyższych poleceń.

   W przypadku wystąpienia błędów lub problemów, upewnij się, że masz poprawną konfigurację DNS i dostępność serwera Nginx.

   Po wykonaniu tych kroków, Twój serwer Nginx powinien być skonfigurowany z certyfikatem SSL, umożliwiając bezpieczne połączenia HTTPS na obsługiwanych domenach.
