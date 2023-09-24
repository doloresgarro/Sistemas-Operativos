#!/bin/bash

num1=$1
num2=$2
operador=$3

if [ $operador = "*" ]; then
        mult=$(expr $num1 /* $num2)
        echo "Multitplicacion entre $num1 y $num2 es: $mult"
elif [ $operador = "+" ]; then
        suma=$(expr $num1 "+" $num2)
        echo "Suma entre $num1 y $num2: $suma"
elif [ $operador = "-" ]; then
        resta=$(expr $num1 "-" $num2)
        echo "Resta entre $num1 y $num2: $resta"
elif [ $operador = "/" ]; then
        division=$(expr $num1 "/" $num2)
        echo "División entre $num1 y $num2: $division"
else
        echo "Operador nó válido"
fi

