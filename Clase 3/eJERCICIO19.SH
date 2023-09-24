#!/bin/bash

#no funciona :(

# muestro menú
echo "MENÚ DE COMANDOS"
echo "Ejercicio3"
echo "EvaluarExpresiones"
echo "EstructurasDeControl"
echo "99 --> Salir"


opciones="Ejercicio3 EvaluarExpresiones EstructurasDeControl"

select opt in $opciones; do	
	case $opt in
		Ejercicio3)
			chmod a+x Ejercicio3.sh 
			./Ejercicio3.sh
		;;
		EvaluarExpresiones)
			echo "Evaluar expresiones "
			echo "Elegir una opción: a - b - c"
			opciones2="a b c"

			select opt2 in $opciones2; do
				case $opt2 in
					a)
						chmod a+x Ejercicio12.sh	
						./Ejercicio12.sh
						break
					;;
				
                                        b)
                                        	chmod a+x Ejercicio12b.sh
                                       		./Ejercicio12b.sh
						break
					;;
				        c)
                                        	chmod a+x Ejercicio12c.sh
                                        	./Ejercicio12c.sh
						break
               		 		;;
				esac
			done
			break
		;;
		EstructurasDeControl)
			echo "Estructuras de control"
			echo "Elegir una opción: a - b - c"
			opciones3="a b c"
			select opt3 in $opciones3; do
				case $opt3 in
					a) 
						chmod a+x Ejercicio13.sh
						./Ejercicio13.sh
						break
					;;
					b) 
						chmod a+x Ejercicio13b.sh 
						./Ejercicio13b.sh
						break
					;;
					c)
					      	chmod a+x Ejercicio13c.sh
				       		./Ejercicio13c.sh
				 		break
					;;
				esac
			done
			break
		;;
	esac
done
		


# read -p "mensaje" opcion --> -p se utiliza para mostrar mensaje y luego esperar el ingreso
# desde teclado



