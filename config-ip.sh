#!/bin/bash
R1=$(sudo docker ps -qf "name=r1$")
R2=$(sudo docker ps -qf "name=r2$")
R3=$(sudo docker ps -qf "name=r3$")
PC_ADMIN=$(sudo docker ps -qf "name=pc-admin$")
PC_VENTAS=$(sudo docker ps -qf "name=pc-ventas$")
SRV_WEB=$(sudo docker ps -qf "name=srv-web$")
SRV_DATOS=$(sudo docker ps -qf "name=srv-datos$")
EXTERNO=$(sudo docker ps -qf "name=externo$")

# IPs de las VLANs en r2
sudo docker exec $R2 ip addr add 172.16.5.1/27 dev eth3.10
sudo docker exec $R2 ip addr add 172.16.5.33/28 dev eth3.20

# PCs de la sede y sus rutas por defecto
sudo docker exec $PC_ADMIN ip addr add 172.16.5.2/27 dev eth1
sudo docker exec $PC_ADMIN ip route del default
sudo docker exec $PC_ADMIN ip route add default via 172.16.5.1

sudo docker exec $PC_VENTAS ip addr add 172.16.5.34/28 dev eth1
sudo docker exec $PC_VENTAS ip route del default
sudo docker exec $PC_VENTAS ip route add default via 172.16.5.33

# Servidores y su router r1
sudo docker exec $R1 ip addr add 172.16.5.49/29 dev eth4

sudo docker exec $SRV_WEB ip addr add 172.16.5.50/29 dev eth1
sudo docker exec $SRV_WEB ip route del default
sudo docker exec $SRV_WEB ip route add default via 172.16.5.49

sudo docker exec $SRV_DATOS ip addr add 172.16.5.51/29 dev eth1
sudo docker exec $SRV_DATOS ip route del default
sudo docker exec $SRV_DATOS ip route add default via 172.16.5.49

# Enlaces entre routers (Area 0 OSPF)
sudo docker exec $R1 ip addr add 172.16.5.57/30 dev eth1
sudo docker exec $R2 ip addr add 172.16.5.58/30 dev eth1

sudo docker exec $R1 ip addr add 172.16.5.61/30 dev eth2
sudo docker exec $R3 ip addr add 172.16.5.62/30 dev eth1

sudo docker exec $R2 ip addr add 172.16.5.65/30 dev eth2
sudo docker exec $R3 ip addr add 172.16.5.66/30 dev eth2

# Enlace a Internet
sudo docker exec $R1 ip addr add 203.0.113.1/29 dev eth3

sudo docker exec $EXTERNO ip addr add 203.0.113.2/29 dev eth1
sudo docker exec $EXTERNO ip route del default
sudo docker exec $EXTERNO ip route add default via 203.0.113.1
