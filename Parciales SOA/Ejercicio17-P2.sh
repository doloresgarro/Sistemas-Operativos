#!/bin/bash


# me guardo en arreglo todos los usuarios del FS
arreglo=($(cat /etc/passwd | cut -d: -f1))

# busca en el arreglo un usuario pasado como parámetro 
existe() {
	if [ $# -eq 0 ]; then
		echo "Ingrese al menos un parámetro"
		exit 1
	fi

	for i in ${arreglo[i]}; do
		if [ "$i" == $1 ]; then
			echo "El parámetro $1 existe en el arreglo"
			return 0	
		else
			echo "El prámetro $1 no existe en el arreglo"
			return 1
		fi
	done
}


# si existe, elimina el usuario pasado como parámetro 
eliminar_usuario() {
	
	if [ $# -eq 0  ]; then
		echo "Ingrese al menos un parámetro"
		exit 1
	fi
	
	encontre=false
	for i in ${#arreglo[*]}; do 
		if [ "$i" == "$1" ]; then
			unset arreglo[i]
			arreglo=(${arreglo[*]})
			encontre=true
			break
		fi
	done

	if (encontre == "false"); then
		echo "No se encontró el usuario"
		exit 2
	else 
		echo "EL usuario se eliminó correctamente"
	fi
}

# imprime los usuarios que contienen el caracter recibido como parámetro
usuarios_con_patron() {
	for i in ${arreglo[*]}; do
		if [ ${arreglo[i]} | grep $1 ]; then
			echo "${arreglo[i]}"
		fi
	done
}

# cantidad total de usuarios en el arreglo
cantidad() {
	echo "${#arreglo[*]}"
}

# imprime todos los nombres de usuarios que están en el arreglo
usuarios() {
	echo "${arreglo[*]}"
}


existe dolores
cantidad
eliminar_usuario 
cantidad
usuarios
