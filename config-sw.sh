#!/bin/bash
# Asignar puerto de PC Admin (swa-p1) a VLAN 10 (Access)
sudo bridge vlan add dev swa-p1 vid 10 pvid untagged
# Remover la VLAN por defecto (VLAN 1) de swa-p1
sudo bridge vlan del dev swa-p1 vid 1

# Asignar puerto de PC Ventas (swa-p2) a VLAN 20 (Access)
sudo bridge vlan add dev swa-p2 vid 20 pvid untagged
# Remover la VLAN por defecto (VLAN 1) de swa-p2
sudo bridge vlan del dev swa-p2 vid 1

# Configurar puerto hacia r2 (swa-p3) como Trunk para VLAN 10 y 20
sudo bridge vlan add dev swa-p3 vid 10
sudo bridge vlan add dev swa-p3 vid 20
