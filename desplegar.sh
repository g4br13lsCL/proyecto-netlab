#!/bin/bash
sudo ip link add name sw-a type bridge vlan_filtering 1
sudo ip link set sw-a up
sudo ip link add name sw-b type bridge
sudo ip link set sw-b up
sudo clab deploy -t netlab.clab.yml

# Pausa para la cracion de interfaces
sleep 5

./config-vlans.sh
./config-ip.sh
./config-sw.sh


./config-ospf.sh
./config-nat.sh

