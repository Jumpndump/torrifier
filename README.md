▄▄▄█████▓ ▒█████   ██▀███   ██▀███   ██▓  █████▒██▓▓█████  ██▀███  
▓  ██▒ ▓▒▒██▒  ██▒▓██ ▒ ██▒▓██ ▒ ██▒▓██▒▓██   ▒▓██▒▓█   ▀ ▓██ ▒ ██▒
▒ ▓██░ ▒░▒██░  ██▒▓██ ░▄█ ▒▓██ ░▄█ ▒▒██▒▒████ ░▒██▒▒███   ▓██ ░▄█ ▒
░ ▓██▓ ░ ▒██   ██░▒██▀▀█▄  ▒██▀▀█▄  ░██░░▓█▒  ░░██░▒▓█  ▄ ▒██▀▀█▄  
  ▒██▒ ░ ░ ████▓▒░░██▓ ▒██▒░██▓ ▒██▒░██░░▒█░   ░██░░▒████▒░██▓ ▒██▒
  ▒ ░░   ░ ▒░▒░▒░ ░ ▒▓ ░▒▓░░ ▒▓ ░▒▓░░▓   ▒ ░   ░▓  ░░ ▒░ ░░ ▒▓ ░▒▓░
    ░      ░ ▒ ▒░   ░▒ ░ ▒░  ░▒ ░ ▒░ ▒ ░ ░      ▒ ░ ░ ░  ░  ░▒ ░ ▒░
  ░      ░ ░ ░ ▒    ░░   ░   ░░   ░  ▒ ░ ░ ░    ▒ ░   ░     ░░   ░ 
             ░ ░     ░        ░      ░          ░     ░  ░   ░     

Automation script for routing a VirtualBox machine traffic over TOR

Ref: https://www.howtoforge.com/how-to-set-up-a-tor-middlebox-routing-all-virtualbox-virtual-machine-traffic-over-the-tor-network

1. Ensure to have following packages installed : bridge-utils dnsmasq tor
2. Run InstallTorrifier.sh as root
3. Run torrifier.sh before running VM
4. In VirtualBox, set the Network Adapter 1 to Bridge, with vnet0 interface

Ensure your VirtualBox machine get an IP address with 172.16.0.xxx and check your external IP address.
