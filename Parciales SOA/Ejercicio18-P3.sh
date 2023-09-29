#!/bin/bash

arreglo=($(ls /var/log | grep access))

# imprime cant de archivos con el texto access en su nombre
cantidad() {
	echo "La cantidad de archivos que tienen el texto access es: ${#arreglo[*]}"
}

# imprime los nombres de todos los archivos del directorio /var/log que tengan el texto access
listar() {
	echo "${arreglo[*]}"
}


eliminar() {
	if [ $# -ne 2  ]; then
		echo "Debe ingresar dos parámetros"
		exit 1
	fi

	# si la posición esta dentro de la dim del arreglo
	if [ $1 -lt ${#arreglo[*]} ];
	then
		case $2 in
			"logico")
				unset {arreglo[$1]}
				arreglo=(${arreglo[*]})
			;;

			"fisico") 
				arch=(${arreglo[$1]})
				unset {arreglo[$1]}
				arreglo=(${arreglo[*]})
				rm /var/log/$arch
			;;

			*) 
				echo "Opción inválida"
				exit 2
			;;
		esac

	else
		echo "Posición inválida"
		exit 1
	fi
}


