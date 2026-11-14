# NetLab Monitor - Proyecto Final

Herramienta de auditoría automatizada por capas para infraestructura virtualizada en Containerlab con VLANs 802.1Q, enrutamiento dinámico OSPF (FRRouting), NAT (MASQUERADE) y servicios de red.

## Estructura del Proyecto
- `netlab.clab.yml`: Definición de la topología en Containerlab.
- `desplegar.sh` / `destruir.sh`: Scripts de automatización y limpieza del entorno.
- `config-*.sh`: Scripts modulares de direccionamiento IP, VLANs, OSPF y NAT.
- `netlab_monitor.py`: Script de auditoría en Python (librería estándar).
- `monitor.json`: Parámetros esperados de la red.
- `docs/`: Plan VLSM, diagrama e informe técnico.
- `evidencias/`: Reportes generados y registros de ejecución.



