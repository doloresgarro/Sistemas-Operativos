#!/bin/bash

if [ $# -eq 0  ]; then
	echo "Debe ingresar al menos un parámetro"
	exit 1
fi

# busco el parámetro entre los usuarios del sistema
encontre=false
for i in /etc/passwd/*; do       # busca en el directorio de usuarios 
	if [ "$i" = $1 ]; then
		encontre=true
		break	
	fi
done

if [ $encontre == "false" ]; then
	echo "Error. No se encontró el usuario"
	exit 1
else
	contador=0
	while [ contador -ne 30 ]; do
		conectado=$(who | grep -w $1 | wc -l)	
		if [ conectado -ne 0 ]; then
			echo "$1 $(date)" >> /var/acces.$1.log
			contador=$(expr $contador + 1)
		fi
		sleep 30
	done
	exit 0
fi

 # who muestra lista de users, grep busca el param y wc cuenta cant veces que aparece

