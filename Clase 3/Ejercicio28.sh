#!/bin/bash 

directorio=$1

# -e --> busca si el directorio existe
if [ ! -d $directorio ]; then
	echo "El directorio no existe"
	exit 4
fi

# si el directorio existe cuenta la cantidad de archivos x separado 
lectura=0
escritura=0

for i in $directorio/*; do  #itera a través de los elem de un directorio
	if [ -f $i ]; then # si es un archivo
		if [ -r $i ]; then 
			((lectura++))
		fi
		if [ -w $i ]; then
			((escritura++))
		fi
	fi
done

echo "Archivos de lectura: $lectura"
echo "Archivos de escritura: $escritura"

