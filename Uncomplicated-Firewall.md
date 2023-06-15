# UFW (Uncomplicated Firewall) Commands

Below are some commonly used UFW commands for managing firewall rules:

- `sudo ufw allow [service_name]`: Allows incoming traffic for a specific service by name.
- `sudo ufw allow [port]`: Allows incoming traffic on a specific port.
- `sudo ufw allow [port_from]:[port_to]`: Allows incoming traffic within a port range.
- `sudo ufw allow [port]/[connection_type]`: Allows incoming traffic on a specific port and connection type.
- `sudo ufw allow [port_from]:[port_to]/[connection_type]`: Allows incoming traffic within a port range and connection type.
- `sudo ufw allow from [IP_address]`: Allows incoming traffic from a specific IP address.
- `sudo ufw allow from [IP_address] to any port [port]`: Allows incoming traffic from a specific IP address to a specific port.
- `sudo ufw allow from [IP_address]/[network_mask] to any port [port]`: Allows incoming traffic from a specific IP address range (specified by network mask) to a specific port.
- `sudo ufw allow from [IP_address]/[network_mask] to any port [port] proto [connection_type]`: Allows incoming traffic from a specific IP address range to a specific port and connection type.
- `sudo ufw allow in on [network_interface] to any port [port]`: Allows incoming traffic on a specific network interface to a specific port.
- `sudo ufw insert [rule_number] deny [port]`: Inserts a deny rule at a specific position in the firewall rule list for a specific port.
- `sudo ufw insert [rule_number] deny from [IP_address]`: Inserts a deny rule at a specific position in the firewall rule list for a specific IP address.

UFW (Uncomplicated Firewall) is a user-friendly command-line tool used for managing firewall rules on Linux systems. It provides a simplified interface for configuring firewall settings and securing network connections. UFW is commonly used on Ubuntu and Debian-based distributions.

With UFW, you can easily allow or deny incoming and outgoing traffic based on predefined rules or custom configurations. It allows you to specify ports, IP addresses, network interfaces, and connection types to define firewall rules. By using UFW, you can enhance the security of your system by controlling network traffic and preventing unauthorized access.

Please note that using `sudo` is necessary to run UFW commands with administrative privileges.
