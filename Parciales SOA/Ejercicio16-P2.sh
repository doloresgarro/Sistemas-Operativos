#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Ingrese al menos un parámetro"
	exit 1
fi

inexistentes=0
for i in $@; do
	# si es un archivo lo comprime y lo guarda en lugar del original
	if [ -f "$i" ]; then
		gzip $i   # genera archivo comprimido archivo.tar.gz
		rm $i     # ??????? esta lìnea es necesaria??? elimina el archivo original 
		echo "Archivo $i comprimido"

	elif [ -d "$i" ]; then
		
		# si tiene permiso de lectura --> empaquetarlo y comprimirlo
		if [ -r $i ]; then
			tar -xvzf nuevo.tar.gz $i # empaqueta y comprime en una sola operación
			echo "Directorio $i empaquetado y comprimido"
		fi
		
		# si tiene permiso de escritura --> eliminarlo junto con todo su contenido
		if [ -w $i ]; then
			rm -rf $i 	
	      		echo "Directorio $i eliminado junto con todo su contenido"		
		fi

	else 
		inexistentes=$(expr $inexistentes + 1)
		echo "No es archivo ni directorio"
	fi

done

echo "La cantidad de archivos inexistentes en el Fyle System es : $inexistentes"
