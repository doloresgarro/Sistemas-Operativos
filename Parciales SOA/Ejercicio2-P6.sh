#!/bin/bash

if [ $# -lt 2 ]; then
	echo "Error, número de parámetros incorrecto"
	exit 1
fi	

# 1er param --> directorio
# 2do en adelante --> archs

if [ -d $1 ]; then
	
	for i in "${@:2}"; do
		if [ -f "$i" ]; then
			if [ -x "$i" ]; then
				echo "Es un archivo. Se tiene permiso de ejecución"
			else
				echo "Es un archivo. No se tiene permiso de ejecución"
			fi	
		elif [ -d "$i" ]; then
			if [ -w "$i"  ]; then
				echo "Es un directorio y se tiene permiso de escritura"
			else
				echo "Es un directorio y no se tiene permiso de escritura"
			fi
		else	
			echo "No es archivo ni directorio"
		fi
	done	
else
	echo "El directorio no existe"
fi
