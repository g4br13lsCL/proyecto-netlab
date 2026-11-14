#!/bin/bash
R1=$(sudo docker ps -qf "name=r1$")
R2=$(sudo docker ps -qf "name=r2$")
R3=$(sudo docker ps -qf "name=r3$")

sudo docker exec $R1 vtysh -c "conf t" -c "router ospf" -c "network 172.16.5.48/29 area 0" -c "network 172.16.5.56/30 area 0" -c "network 172.16.5.60/30 area 0" -c "default-information originate"
sudo docker exec $R2 vtysh -c "conf t" -c "router ospf" -c "network 172.16.5.0/27 area 0" -c "network 172.16.5.32/28 area 0" -c "network 172.16.5.56/30 area 0" -c "network 172.16.5.64/30 area 0"
sudo docker exec $R3 vtysh -c "conf t" -c "router ospf" -c "network 172.16.5.60/30 area 0" -c "network 172.16.5.64/30 area 0"
