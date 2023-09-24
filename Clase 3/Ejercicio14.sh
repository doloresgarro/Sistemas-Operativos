#!/bin/bash 

# Si los parámetros recibidos no son 3 entonces cierra el script e imprime 0
if [ $# -ne 3 ]; then
	echo "No se pasaron correctamente los parámetros"
	exit 1
fi

# Párametros que recibe 
directorio=$1
opcion=$2
cadena=$3

# Si el directorio no existe 
if [ ! -d $directorio ]; then
	echo "EL directorio $directorio no existe"
	exit 1
fi

# Me posiciono en el directorio
cd $directorio 


# el for recorre todo el directorio actual hasta encontrar el archivo, si lo encuentra lo renombra según la opción
case $opcion in
	-a) 
		for archivo in *; do 
			if [ -f $archivo ]; then
			       mv "$archivo" "${archivo}${cadena}"  # cadena al final del nombre
			fi
		done
	;;
	-b)
		for archivo in *; do
                        if [ -f $archivo ]; then
                               mv "$archivo" "${cadena}${archivo}" # cadena al principio del nombre
                        fi
                done  	
		;;
	*)
		echo "Opción no válida"
		exit 1
		;;
esac

cd - > /dev/null 
#para que no se imprima en pantalla el directorio al que cambie con el cd
