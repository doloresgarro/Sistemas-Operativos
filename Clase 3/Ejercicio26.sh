#!/bin/bash 

if [ $# -eq 0 ]; then
	echo "Ingrese al menos un argumento"
	exit 1
fi

arreglo=("$@") # --> almacena x cantidad de argumentos que recibe el script
inexistentes=0

for ((i=1; i<${#arreglo[*]}/2; i+2)); do 
	if [ -d " ${arreglo[$i]}"  ]; then
		echo "${arreglo[$i]}  es un directorio"			
	elif [ -f " ${arreglo[$i]}"  ]; then
		echo "${arreglo[$i]}  es un archivo"
	elif [ ! -e ${arreglo[$i]} ]; then 
		((inexistentes++))
	fi
done

echo "Inexistentes: $inexistentes"
