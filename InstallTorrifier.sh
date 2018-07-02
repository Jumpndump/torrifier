#!/bin/sh

echo 'Be sure the following are installed before continuing:
- bridge-utils
- dnsmasq
- tor
'

echo -n "Press any key to continue... "
read input
#if [ "$input" == "${input#[Yy]}" ] ;then
# exit
#fi

# Bridge interface and NAT configuration
echo '[+] Configuring bridge interface and NAT postrouting'
echo '#Virtualbox NAT Bridge
auto vnet0
iface vnet0 inet static
 address 172.16.0.1
 netmask 255.255.255.0
 bridge_ports none
 bridge_maxwait 0
 bridge_fd 1

up iptables -t nat -I POSTROUTING -s 172.16.0.0/24 -j MASQUERADE
down iptables -t nat -D POSTROUTING -s 172.16.0.0/24 -j MASQUERADE
' >> /etc/network/interfaces

echo '[+] Enabling vnet0'
ifup vnet0

# DHCP and DNS configuration
echo '[+] Configuring Dnsmasq'
echo 'interface=vnet0
dhcp-range=172.16.0.2,172.16.0.254,1h
' >> /etc/dnsmasq.conf

echo '[+] Starting Dnsmasq'
systemctl restart dnsmasq

# TOR configuration
echo '[+] Configuring Tor'
echo 'VirtualAddrNetwork 10.192.0.0/10
AutomapHostsOnResolve 1
TransPort 9040
TransListenAddress 172.16.0.1
DNSPort 53
DNSListenAddress 172.16.0.1
' >> /etc/tor/torrc

echo '[+] Starting Tor'
systemctl restart tor
echo 'Install completed. Please launch torrifier.sh before launching your VM'
