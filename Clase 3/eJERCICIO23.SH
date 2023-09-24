#!/bin/bash

num=(1 2 3 4 5)

ParImpar(){
	impares=0

	for ((i=0; i<${#num[*]}; i++))
	do
		if [ $((num[i] % 2)) -eq 0 ]; then # si es par lo imprime
			echo ${num[i]} 
		else
			impares=$((impares+1))
		fi	
	done
}

ParImpar
echo "La cantidad de numeros impares es: $impares"
