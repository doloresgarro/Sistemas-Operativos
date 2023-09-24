#!/bin/bash 

if [ $# -ne 1 ]; then
	echo "Los parámetros recibidos no son los correctos>"
	exit 1
fi

extension=$1

# creo un informe en el archivo reporte.txt
# > reporte.txt --> operador de redirección que toma la salida estándar del comando echo
# y la dirige hacia el archivo reporte.txt
echo "Nombre de usuario | Cantidad de archivos con extension .$extension" > reporte.txt

# recorro archivos con extensión especificada

fin . -type f -name "*.$extension" | 
