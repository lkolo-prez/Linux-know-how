
```yaml
---
- hosts: management_node
  become: yes
  vars_files:
    - vars.yml
  tasks:
    - name: Install necessary packages
      apt:
        name: "{{ item }}"
        state: present
      loop:
        - libclass-methodmaker-perl
        - mysql-cluster-community-management-server

    - name: Setup config.ini for MySQL Cluster
      template:
        src: /path/to/your/templates/config.ini.j2
        dest: /var/lib/mysql-cluster/config.ini
        owner: mysql
        group: mysql

    - name: Start ndb_mgmd service
      systemd:
        name: ndb_mgmd
        state: restarted
        enabled: yes

- hosts: data_nodes
  become: yes
  vars_files:
    - vars.yml
  tasks:
    - name: Install necessary packages
      apt:
        name: "{{ item }}"
        state: present
      loop:
        - libclass-methodmaker-perl
        - mysql-cluster-community-data-node

    - name: Setup my.cnf for MySQL Cluster
      template:
        src: /path/to/your/templates/my.cnf.j2
        dest: /etc/my.cnf
        owner: mysql
        group: mysql

    - name: Start ndbd service
      systemd:
        name: ndbd
        state: restarted
        enabled: yes
```

Plik `vars.yml` powinien zawierać następujące zmienne:

```yaml
---
management_node_private_ip: 'your_management_node_private_ip'
data_node1_private_ip: 'your_data_node1_private_ip'
data_node2_private_ip: 'your_data_node2_private_ip'
```

Będziesz także potrzebować następujących szablonów Jinja2:

`config.ini.j2`:

```
[ndbd default]
NoOfReplicas=2

[ndb_mgmd]
NodeId=1
HostName={{ management_node_private_ip }}

[ndbd]
NodeId=2
HostName={{ data_node1_private_ip }}

[ndbd]
NodeId=3
HostName={{ data_node2_private_ip }}
```

`my.cnf.j2`:

```
[mysql_cluster]
ndb-connectstring={{ management_node_private_ip }}
```

Zmienne te mogą być używane w playbooku ansible, a ich wartości mogą być zmienione, aby dopasować do twojego konkretnego środowiska. Pamiętaj, żeby zastąpić wszystkie wystąpienia `'your_...'` odpowiednimi wartościami dla twojego środowiska.

Uwaga: Ten playbook zakłada, że masz uprawnienia do instalowania pakietów i zarządzania usługami na docelowych hostach, a także że szablony Jinja2 są dostępne w podanych ścieżkach. Jeśli te założenia nie

Poniżej znajduje się przykładowy playbook Ansible do konfiguracji MySQL Cluster z 3 węzłami (1 węzeł zarządzania, 2 węzły danych) na serwerach Ubuntu. 

Proszę zauważyć, że ten playbook jest dość skomplikowany i wymaga odpowiednich zmiennych środowiskowych. Z tego powodu ważne jest, aby zrozumieć, co każde zadanie robi, i dostosować je do swojego konkretnego środowiska.

```yaml
---
- hosts: management_node
  become: yes
  vars_files:
    - vars.yml
  tasks:
    - name: Install necessary packages
      apt:
        name: "{{ item }}"
        state: present
      loop:
        - libclass-methodmaker-perl
        - mysql-cluster-community-management-server

    - name: Setup config.ini for MySQL Cluster
      template:
        src: /path/to/your/templates/config.ini.j2
        dest: /var/lib/mysql-cluster/config.ini
        owner: mysql
        group: mysql

    - name: Start ndb_mgmd service
      systemd:
        name: ndb_mgmd
        state: restarted
        enabled: yes

- hosts: data_nodes
  become: yes
  vars_files:
    - vars.yml
  tasks:
    - name: Install necessary packages
      apt:
        name: "{{ item }}"
        state: present
      loop:
        - libclass-methodmaker-perl
        - mysql-cluster-community-data-node

    - name: Setup my.cnf for MySQL Cluster
      template:
        src: /path/to/your/templates/my.cnf.j2
        dest: /etc/my.cnf
        owner: mysql
        group: mysql

    - name: Start ndbd service
      systemd:
        name: ndbd
        state: restarted
        enabled: yes
```

Plik `vars.yml` powinien zawierać następujące zmienne:

```yaml
---
management_node_private_ip: 'your_management_node_private_ip'
data_node1_private_ip: 'your_data_node1_private_ip'
data_node2_private_ip: 'your_data_node2_private_ip'
```

Będziesz także potrzebować następujących szablonów Jinja2:

`config.ini.j2`:

```
[ndbd default]
NoOfReplicas=2

[ndb_mgmd]
NodeId=1
HostName={{ management_node_private_ip }}

[ndbd]
NodeId=2
HostName={{ data_node1_private_ip }}

[ndbd]
NodeId=3
HostName={{ data_node2_private_ip }}
```

`my.cnf.j2`:

```
[mysql_cluster]
ndb-connectstring={{ management_node_private_ip }}
```

Zmienne te mogą być używane w playbooku ansible, a ich wartości mogą być zmienione, aby dopasować do twojego konkretnego środowiska. Pamiętaj, żeby zastąpić wszystkie wystąpienia `'your_...'` odpowiednimi wartościami dla twojego środowiska.

Uwaga: Ten playbook zakłada, że masz uprawnienia do instalowania pakietów i zarządzania usługami na docelowych hostach, a także że szablony Jinja2 są dostępne w podanych ścieżkach. Jeśli te założenia nie

są prawdziwe dla twojego środowiska, będziesz musiał dostosować playbook do swoich potrzeb.

Zauważ, że ten playbook nie obejmuje instalacji i konfiguracji serwerów SQL dla MySQL Cluster. W typowym środowisku MySQL Cluster, będziesz miał oddzielne serwery (nazywane węzłami SQL lub mysqld), które są odpowiedzialne za przetwarzanie zapytań SQL i komunikację z węzłami danych. Te serwery SQL mogą być zainstalowane na tych samych hostach co węzły danych lub na oddzielnych hostach, w zależności od wymagań twojego środowiska.

Playbook Ansible do instalacji i konfiguracji serwerów SQL może wyglądać podobnie do playbooka dla węzłów danych, ale zamiast instalować `mysql-cluster-community-data-node`, będziesz instalować `mysql-server` lub odpowiedni pakiet dla twojego dystrybucji Linux, a następnie konfigurować serwer MySQL do połączenia się z węzłami zarządzania i danych MySQL Cluster.

Zawsze pamiętaj, że wdrażanie i zarządzanie MySQL Cluster to skomplikowane zadanie, które wymaga dobrej znajomości MySQL, a także umiejętności zarządzania konfiguracją i infrastrukturą. Zalecamy, aby przeprowadzić dokładne testy i dostosować ten playbook do swojego środowiska przed wdrożeniem go na produkcję.
