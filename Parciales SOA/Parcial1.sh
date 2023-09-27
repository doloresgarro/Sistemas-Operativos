#!/bin/bash


for i in $(cat /etc/passwd); do
	usuario=$(echo "$i" | cut -d: -f1) # f1--> nombre de usuario 
	dir=$(echo "$i" | cut -d: -f6)     # f6--> directorio
	b=$(echo "$i" | cut -d: -f7)       # f7--> bash

	if [ $(sudo find $dir -type d -name mailDir | wc -l ) -eq 1 ] && [ "$b" = "/bin/bash"  ];
       	then
		echo "$usuario" >>/var/listado.txt
	fi

done

# sudo --> pide permiso para acceder a los directorios
# find $dir -type d -name mailDir --> busca directorio con el nombre mailDir
