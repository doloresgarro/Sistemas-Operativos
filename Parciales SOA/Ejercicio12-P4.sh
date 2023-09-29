#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Num de parametros incorrecto"
	exit 1
fi


arch="/var/log/any-service/error.log"
while true; do
	if [ -f $arch  ]; then 
		echo "Existe el archivo $arch"
		if [ $(cat $arch | grep "FATAL ERROR:" | wc -l) -ge 1 ]; then
			tar -cvzf "$1.tar.gz" $arch
			contador=($(cat $arch | grep "FATAL ERROR:" | wc -l))
			echo "La cantidad de veces que aparece FATAL ERROR es $contador"
			exit 0
		fi
	fi
	sleep 180
done
