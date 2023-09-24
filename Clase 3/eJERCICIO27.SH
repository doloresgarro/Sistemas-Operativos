#!/bin/bash

arreglo=()


# Agrega un elemento al final del arreglo
inicializarVacio() {
	arregloVacio=()
}

# Agrega un elemento al final del arreglo
agregar_elem() {
	arreglo[ ${#arreglo[*]} ]=$1
}

# Elimina elemento en una posición determinada
eliminar_elem() {
	if [ $# -ne 1  ]; then
		echo "Debe ingresar una posición"
	else
		if [ $1 -lt ${#arreglo[*]}  ]; then
			unset arreglo[$1]
			echo "Elemento eliminado en la posición $1"
		else 
			echo "La posición está fuera de la dimL del arreglo"
		fi
	fi
}

# Imprime longitud del arreglo
longitud() {
	echo ${#arreglo[*]}
}

# Imprime todos los elementos del arreglo
imprimir() {
	echo ${arreglo[*]}
}


# Inicializa con valores
inicializar() {
	 dimL=$1
	 valor=$2
	 arreglo=()

	for ((i=0; i<dimL; i++)); do 
		arreglo[$i]=$valor
	done
}




inicializar 5 holiiiiiiii
imprimir
eliminar_elem 2
imprimir
longitud


