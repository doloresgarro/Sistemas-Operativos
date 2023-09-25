#!/bin/bash

bin="$HOME/bin" # directorio bin

if [ ! -d "$bin" ]; then
	mkdir -p "$bin" # si no existe lo creo
	echo "Se creo el directorio bin"
fi

movidos=0

for arch in $(find "$PWD" -name "*.sh"); do
	# mover archivo ejecutable al directorio "bin" del usuario
	mv $arch $bin  # mueve archivo a la carpeta bin
	
	if [ $? -eq 0  ]; then
		echo "Se movió el archivo $arch correctamente"
	else
		echo "No se puedo mover el archivo $arch"
	fi
	movidos=$((movidos+1))
done

if [ $movidos -eq 0 ]; then
	echo "No se movieron archivos ejecutables"
else 
	echo "Total de archivos movidos: $movidos"
fi

		
