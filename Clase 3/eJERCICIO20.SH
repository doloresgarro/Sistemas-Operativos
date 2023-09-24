#!/bin/bash

# comportamiento de pila
pila=()

# función push: recibe un parámetro y lo agrega a la pila
push(){
	elem=$1
	pila[${#pila[@]}]=$elem
}

# función pop: saca un elemento de la pila
pop(){
	unset pila[${#pila[@]}-1]
}

# función length: devuelve longitud de la pila
length(){
	echo ${#pila[@]}
}

# funcion print: imprime elementos de la pila 
print(){
	echo ${pila[*]}
}



push "1"
push "2"
push "3"
length
print

pop 
pop
length
print
