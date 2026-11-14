#!/bin/bash
R1=$(sudo docker ps -qf "name=r1$")
sudo docker exec $R1 iptables -t nat -A POSTROUTING -o eth3 -j MASQUERADE
