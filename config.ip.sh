#!/bin/bash
# IPs de las VLANs en r2
sudo docker exec clab-netlab_Grupo5-r2 ip addr add 172.16.5.1/27 dev eth3.10
sudo docker exec clab-netlab_Grupo5-r2 ip addr add 172.16.5.33/28 dev eth3.20

# PCs de la sede y sus rutas por defecto
sudo docker exec clab-netlab_Grupo5-pc-admin ip addr add 172.16.5.2/27 dev eth1
sudo docker exec clab-netlab_Grupo5-pc-admin ip route add default via 172.16.5.1
sudo docker exec clab-netlab_Grupo5-pc-ventas ip addr add 172.16.5.34/28 dev eth1
sudo docker exec clab-netlab_Grupo5-pc-ventas ip route add default via 172.16.5.33

# Servidores y su router r1
sudo docker exec clab-netlab_Grupo5-r1 ip addr add 172.16.5.49/29 dev eth4
sudo docker exec clab-netlab_Grupo5-srv-web ip addr add 172.16.5.50/29 dev eth1
sudo docker exec clab-netlab_Grupo5-srv-web ip route add default via 172.16.5.49
sudo docker exec clab-netlab_Grupo5-srv-datos ip addr add 172.16.5.51/29 dev eth1
sudo docker exec clab-netlab_Grupo5-srv-datos ip route add default via 172.16.5.49

# Enlaces entre routers (Area 0 OSPF)
sudo docker exec clab-netlab_Grupo5-r1 ip addr add 172.16.5.57/30 dev eth1
sudo docker exec clab-netlab_Grupo5-r2 ip addr add 172.16.5.58/30 dev eth1

sudo docker exec clab-netlab_Grupo5-r1 ip addr add 172.16.5.61/30 dev eth2
sudo docker exec clab-netlab_Grupo5-r3 ip addr add 172.16.5.62/30 dev eth1

sudo docker exec clab-netlab_Grupo5-r2 ip addr add 172.16.5.65/30 dev eth2
sudo docker exec clab-netlab_Grupo5-r3 ip addr add 172.16.5.66/30 dev eth2

# Enlace a Internet
sudo docker exec clab-netlab_Grupo5-r1 ip addr add 203.0.113.1/29 dev eth3
sudo docker exec clab-netlab_Grupo5-externo ip addr add 203.0.113.2/29 dev eth1
sudo docker exec clab-netlab_Grupo5-externo ip route add default via 203.0.113.1
