#!/bin/bash

if [ $# -eq 0  ]; then
	echo "Ingrese al menos un parámetro"
	exit 1
fi


esta_logueado() {
	if [ $(who | cut -d" " -f1 | grep -w $1 | wc -l) -ne 0 ]; then
		exit 0
	else 
		exit 
	fi
}

# who devuelve una lista de usuarios
# cut -d " " -f1 --> divide cada linea en espacios separados y extrae el nombre de usuario
# grep -w $1 --> busca el $1 en la lista de usuarios
# wc -l --> cuenta el num de veces que aparece



cant_procesos() {
	esta_logueado $1
	if [ $? -eq 0 ]; then
		cant=$(ps -aux | grep -w $1 | wc -l)
		echo "$cant"	
	else
		exit 0
	fi
}

# ps -aux --> muestra lista de procesos en ejecución con detaller
# grep -w $1 --> busca el usuario que los corre en la lista de procesos
# wc -l --> cuenta el num de veces que aparece


uso_de_procesos() {
	cant_procesos $1
	if [ $? -ge 100 ]; then # si el num de procesos es mayor a 100
		exit 0
	else
		exit 1
	fi
}


echo "Fecha: $(date)">>/var/log/reporte
for i in $*; do
	uso_de_procesos $i
	if [ $? -eq 0 ]; then
		echo "NOMBRE: $i">>/var/log/reporte
	fi
done

# agrega una linea que dice la fecha al archivo reporte ubicado en /var/log
# el for itera sobre la lista de nombres de usuarios contenidos en $?
# para cada usuario se ve cuantos procesos utiliza 
 






