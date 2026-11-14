#!/bin/bash
R2=$(sudo docker ps -qf "name=r2$")
sudo docker exec $R2 ip link add link eth3 name eth3.10 type vlan id 10
sudo docker exec $R2 ip link set dev eth3.10 up

sudo docker exec $R2 ip link add link eth3 name eth3.20 type vlan id 20
sudo docker exec $R2 ip link set dev eth3.20 up
