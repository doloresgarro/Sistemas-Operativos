#!/bin/bash


# inserta un elemento recibido como parámetro al final del arreglo
insert() {
	if [ $# - eq 1  ]; then
		arreglo=+($1) # agrega al final del arreglo el paŕametro
	else
		echo "Número de parámetros incorrecto"
		exit 1
	fi
}


# itera $1 veces e inserta el elemento ingresado por el usuario
rellenar() {
	if [ $# -eq 1 ]; then
		for (i=0; i<$1; i++); do
			echo "Ingrese un patrón de texto: "
			read patron
			arreglo=+($patron)
		done	
	else
		echo "Número de parámetros incorrecto"
		exit 1
	fi
}


select_elemento() {
	if [ $# -eq 1]; then
		
		# si el param es "*" imprime todos los elem del arreglo
		if [ $1 == "*"  ]; then
			echo "${arreglo[*]}"
		else
			existe=false
			for i in ${#arreglo[*]}; do
				if [ "$i" == $1  ]; then
					existe=true
					break
				fi	
			done

			if [ $existe == "false" ]; then
				echo "Elemento no encontrado"
			else
				echo "$1"
			fi
		fi
	else
		echo "Número de parámetros incorrecto"
		exit 1
	fi
}



delete_elemento() {
	if [ $# -eq 1 ]; then
		
		# si el parámetro es "*" elimina todos los elementos del arreglo
		if [ $1 == "*" ]; then
			for i in ${#arreglo[*]}; do
				unset arreglo[i]
			done
			arreglo=(${arreglo[*]})
			echo "Se eliminaron todos los elementos del arreglo"
		
		else
			# si el param no es "*" busca elem que sea igual y lo elimina
			existe=false
			for i in ${#arreglo[*]}; do
				if [ "$i" == $1 ]; then
					existe=true
					unset arreglo[$i]
					arreglo=(${arreglo[$i]})
					break
				fi
			done

			if [  $existe == "false" ]; then
				echo "Elemento no encontrado"
			fi

		fi	

	else
		echo "Número de parámetros incorrecto"
		exit 1
	fi

}



















