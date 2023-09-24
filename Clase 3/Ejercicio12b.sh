#!/bin/bash

num1=$1
num2=$2

mult=$(expr $num1 "*" $num2)
echo "La multitplicacion entre $num1 y $num2 es: $mult"

suma=$(expr $num1 "+" $num2)
echo "Suma entre $num1 y $num2: $suma"

resta=$(expr $num1 "-" $num2)
echo "Resta entre $num1 y $num2: $resta"

if [ $num1 -lt $num2 ]; then
	echo " $num1 es menor que $num2 "
elif [ $num1 -eq $num2 ]; then
	echo "Son iguales"
else 
	echo "$num1 es mayor que $num2 "
fi
