#!/bin/bash

for archivo in *; do
	if [ -f "$archivo"  ]; then
		nuevo_nom=$(echo "$archivo" | tr 'a-zA-Z' 'A-Za-z' | tr -d 'Aa')
		mv "$archivo" "$nuevo_nom"
		echo "$nuevo_nom"
	fi
done

# tr 'a-zA-Z' 'A-Za-z'--> convierte minusculas en mayusculas y viceversa

#  tr -d 'Aa' --> elimina la letra "a" del nombre del archivo
