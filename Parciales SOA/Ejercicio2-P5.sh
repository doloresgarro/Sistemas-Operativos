#!/bin/bash


# lista en la salida estándar, de a uno por línea, usuarios que están en el arreglo
listar() {
        for i in ${#usuarios[*]}; do
                echo "$i"
        done
}

# presenta lista de usuarios con sus índices y luego pide al usuario el índice a eliminar
eliminar() {
        for ((i=0; i<${#usuarios[*]}; i++));
        do
                echo "Índice: $i - Usuario: ${usuarios[i]} "
        done

        echo "Indique el índice del elemento a eliminar:"
        read pos

        unset usuarios[$pos]
        usuarios=( ${usuarios[*]} )   # para eliminar espacios en blanco
        echo "Usuario eliminado del arreglo"

}

# cantidad de elementos que tiene el arreglo
contar() {
        echo "${#usuarios[*]}"
}


#---------------------------------------------------------------------------------


if [ $# -eq 0 ]; then
	echo "Ingrese al menos un parámetro"
	exit 1
fi

# almaceno usuarios que tengan el patròn recibido como parámetro
usuarios=($(cat /etc/passwd | cut -d: -f1 | grep $1)) 
echo "Usuarios: $usuarios"

echo "MENÚ. Seleccione la operación a realizar:"
echo "listar (l) - eliminar (e) - contar(c) - finalizar (f)"


select op in l e c f; do
	case $op in 
		"l")
			listar 
			;;
		"e")
			eliminar
			;;
		"c") 	
			contar
			;;
		"f")	
			exit 0
			;;
		*) 	
			echo "Opción inválida"
			;;
	esac
done


