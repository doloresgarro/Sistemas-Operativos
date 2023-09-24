#!/bin/bash

num1=$1
num2=$2
operador=$3

if [ $operador = "*" ]; then
	mult=$(expr $num1 "*" $num2)
	echo "La multitplicacion entre $num1 y $num2 es: $mult"
elseif [ $operador = "+" ]; then
	suma=$(expr $num1 "+" $num2)
	echo "Suma entre $num1 y $num2: $suma"
elseif [ $operador = "-" ]; then
	resta=$(expr $num1 "-" $num2)
	echo "Resta entre $num1 y $num2: $resta"
elseif [ $operador = "/" ]; then
	division=$(expr $num1 "/" $num2)
	echo "División entre $num1 y $num2: $division"
else 
	echo"Operador nó válido"
fi
