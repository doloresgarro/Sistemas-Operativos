#!/bin/bash

if [ $# -eq 3  ]; then
	echo "Debe ingresar al menos tres parámetros"
	exit 2
fi

fecha=$1


if [ $(ls /var/log | cut -d "." -f2 | grep $1 | wc -l) -eq 0 ]; then
	echo "La fecha no existe"
	exit 2   
fi

# ls /var/log --> lista archivos de /var/log
# cut -d "." -f2 --> se queda con la columna 2 que contiene la fecha (acces.X.log)
# grep $1 --> busca en el listado la fecha recibida como param
# wc -l --> cuenta cant de veces que aparece
# compara con 0 --> si es 0 es porque la fecha no se encontró


# ${@} --> argumentos pasados al script
# ${@:2} --> argumentos después del segundo
# los cuales pueden ser una o mas direcciones IP

# para las direcciones IP recibidas: 
for i in ${@:2}; do
	cant=$(cat /var/log/acces.$1.log | cut -d "-" -f1 | grep $i | wc -l)
	echo "$i - $cant"
done	

# cat /var/log/acces.$1.log --> muestra el contenido del archivo en esa fecha
# cut -d "-" -f1 --> cut separa con "-" se queda con la columna 1 (contiene el IP)
# grep $i --> busca el IP en el arch seleccionado de la fecha
# cuenta la cant de veces que aparece el IP en la fecha
