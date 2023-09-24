#!/bin/bash 

vector1=(1 2 3 4)
vector2=(10 20 30 40)

SumaVectores() {
	for ((i=0; i<${#vector1[*]}; i++))
	do
		suma=0
		suma=$((vector1[i] + vector2[i]))
		echo "La suma de los elementos de la posicion $i de los vectores es $suma"
	done
}

SumaVectores
