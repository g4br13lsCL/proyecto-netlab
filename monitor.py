import json
import subprocess
import datetime
import os
import argparse

parser = argparse.ArgumentParser(description="NetLab Monitor - Auditoría de red")
parser.add_argument("-c", "--config", default="monitor.json", help="Ruta al archivo de configuración JSON")
args = parser.parse_args()

# 1. Cargar el archivo de configuración
try:
    with open(args.config) as archivo:
        config = json.load(archivo)
except FileNotFoundError:
    print(f"❌ Error: No se encontró el archivo de configuración '{args.config}'.")
    exit(1)

print("=" * 60)
print(f"📡 Iniciando NetLab Monitor - {datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
print("=" * 60)

nodos = config.get("nodos", [])
archivo_log = "monitor_log.txt"

# 2. Abrir archivo de log y auditar cada nodo
with open(archivo_log, "a") as log:
    for nodo in nodos:
        nombre = nodo.get("nombre")
        ip = nodo.get("ip")
        
        # Ejecutar ping (-c 1 envía un paquete, -W 1 espera máximo 1 segundo)
        comando = ["ping", "-c", "1", "-W", "1", ip]
        resultado = subprocess.run(comando, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        
        marca_tiempo = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        
        if resultado.returncode == 0:
            estado = "ACTIVO"
            mensaje = f"[{marca_tiempo}] {nombre} ({ip}) -> {estado}"
            print(f"✅ {mensaje}")
        else:
            estado = "CAÍDO"
            mensaje = f"[{marca_tiempo}] {nombre} ({ip}) -> {estado} !!!"
            print(f"❌ {mensaje}")
            
        log.write(mensaje + "\n")

print("=" * 60)
print(f"💾 Auditoría finalizada. Resultados guardados en: {archivo_log}")
