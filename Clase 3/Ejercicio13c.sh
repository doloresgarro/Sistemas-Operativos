#!/bin/bash

nombre_arch=$1

if [ "$#" -ne 1 ]; then
	echo "Uso:$0<nombre_arch>"
	exit 1
fi

nombre=$1

if [ -e $nombre ]; then
	if [ -d $nombre ]; then
		echo "$nombre es un directorio"
	elif [ -f $nombre ]; then
		echo "$nombre es un archivo"
	else
		echo "$nombre existe pero no es ni directorio ni archivo"
	fi
else
	mkdir "$nombre"
	if [ $? -eq 0 ]; then
		echo "Se creo el directorio $nombre exitosamente"
	else
		echo "No se puedo crear el directorio $nombre"
	fi
fi
