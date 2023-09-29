#!/bin/bash

municipios=($(cat /var/log/municipios.txt | cut -d " " -f1))

# recibe un nombre y verifica si existe en el arreglo devolviendo un valor adecuado
existeMunicipio() {
	if [ $# -eq 1 ]; then

		for mun in ${municipios[*]}; do
			if [ "$mun" == "$1" ]; then
				echo "Existe el municipio $mun en el arreglo"
				return 0
			fi
		done
		
		echo "No se encontró $1 en el arreglo"
		return 1

	else
		"Número de parámetros incorrecto"
		exit 1
	fi
}


# recibe nombre y lo agrega al arreglo. No debe haber nombres repetidos --> usar existeMunicipio()
agregarMunicipio() {
	if [ $# eq -1 ]; then
		existeMunicipio $1

		if [ $? -eq 0]; then
			echo "El municipio $1 ya existe en el arreglo"
			exit 1
		else 
			municipios+=($1) 
			echo "Se agregó $1 al final del arreglo"
			exit 0
		fi
	else
		echo "Número de parámetros incorrecto"
		exit 1
	fi
}


# lista todos los municipios agregados al arreglo
listarMunicipios() {
	echo "Lista de municipios: "
	echo "${arreglo[*]}"
}


cantidadMunicipios() {
	echo "Cantidad de municipios ${#municipios[*]}"
}









