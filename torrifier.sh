#!/bin/sh

# destinations you don't want routed through Tor
NON_TOR="192.168.1.0/24"

# Tor's TransPort
TRANS_PORT="9040"

# your internal interface
INT_IF="vnet0"

iptables -F
iptables -t nat -F

for NET in $NON_TOR; do
 iptables -t nat -A PREROUTING -i $INT_IF -d $NET -j RETURN
done
iptables -t nat -A PREROUTING -i $INT_IF -p udp --dport 53 -j REDIRECT --to-ports 53
iptables -t nat -A PREROUTING -i $INT_IF -p tcp --syn -j REDIRECT --to-ports $TRANS_PORT
