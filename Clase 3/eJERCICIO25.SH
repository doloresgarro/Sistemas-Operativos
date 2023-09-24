#!/bin/bash

# arreglo vacío
usuarios=()

# tomo nombres de usuarios y los guardo en el arreglo
arreglo=($(cat /etc/group | grep users | cut -d: -f4 | tr ',' ' '))

param=$1
pos=$2

case $param in
	-b) # si existe el elem en la pos "n" lo imprime
		if [ ${#arreglo[*]} >= pos ]; then 
			echo "${#arreglo[$pos]}"
		else
			echo "Error, el elemento en la posicion $pos no existe"
		fi
	;;
	-l) # longitud del arreglo
		echo "${#arreglo[*]}" 
	;;
	-i) #imprime todos los elem del arreglo en pantalla
		echo "${arreglo[*]}" 	
	;;
	*)
		echo "Parámetro no válido"
	;;
esac

# cat /etc/groups --> muestra el contenido del archivo etc/group q tiene info de los usuarios 
# grep users --> se utiliza para buscar lineas con la palabra users 
# cut -d: -f4 --> divide c/ linea en campos utilizando : y dsp selecciona el cuarto campo (-f4) 
# que contiene los nombres de usuarios
# tr ',' ' ' --> reemplaza "," por espacio en blanco

