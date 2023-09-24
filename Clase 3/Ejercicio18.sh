#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Número de parámetros incorrecto"
	exit 1
fi

user=$1

while true; do
	if who | grep -q $user ;then
		echo "Usuario $user logueado"
		exit 0
	fi
	sleep 10
done


# who | grep -q $usuario --> si el usuario es encontrado devuelve 0, cc 1
# grep busca una cadena de texto en la salida de who

# el -q hace que el grep funcione en modo silencioso, es decir no muestra en pantalla todo
# el proceso de búsqueda sino que solo devuelve 0 o 1

# sleep 10 --> pausa la ejecución de un script/programa por 10 segs (o los indicados).
# El script se queda inactivo durante ese período de tiempo. 
