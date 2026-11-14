#!/bin/bash
# Router 1
sudo docker exec clab-netlab_Grupo5-r1 sh -c 'echo "service integrated-vtysh-config" > /etc/frr/vtysh.conf'
sudo docker exec clab-netlab_Grupo5-r1 sed -i 's/ospfd=no/ospfd=yes/g' /etc/frr/daemons
sudo docker exec clab-netlab_Grupo5-r1 /etc/init.d/frr restart

# Router 2
sudo docker exec clab-netlab_Grupo5-r2 sh -c 'echo "service integrated-vtysh-config" > /etc/frr/vtysh.conf'
sudo docker exec clab-netlab_Grupo5-r2 sed -i 's/ospfd=no/ospfd=yes/g' /etc/frr/daemons
sudo docker exec clab-netlab_Grupo5-r2 /etc/init.d/frr restart

# Router 3
sudo docker exec clab-netlab_Grupo5-r3 sh -c 'echo "service integrated-vtysh-config" > /etc/frr/vtysh.conf'
sudo docker exec clab-netlab_Grupo5-r3 sed -i 's/ospfd=no/ospfd=yes/g' /etc/frr/daemons
sudo docker exec clab-netlab_Grupo5-r3 /etc/init.d/frr restart
