#!/bin/bash


# Inicializo arreglo
arreglo=()

for arch in /home/dolores/*.doc; do # busca en /home los archivos con extensión .doc
	if [ -f $arch ]; then
		arreglo+=$arch
	fi
done

verArchivo() {
	if [ $# -ne 1 ]; then
		echo "Número de parámetros incorrecto"
	fi	
	
	encontre=false
	for elemento in "${arreglo[*]}"; do
		echo "ENTRAAAAAAAAAAAAAAA"
		if [ $elemento=$1 ]; then
		
			cat /home/dolores/$1
			encontre=true
			break
		fi
	done
	
	if [ ! $encontre ]; then
		echo "Archivo no encontrado"
		exit 5
	fi		
}


# Imprime cantidad de archivos del directorio con extensión .doc
cantidadArchivos() {
	echo "${#arreglo[*]}"
}

# Elimina un archivo seleccionado por el usuario si existe
borrarArchivo() {
	encontre=false
	
	for i in "${arreglo[*]}"; do
		
		if [ "${arreglo[i]}"=$1 ]; then
			encontre=true
			
			# pregunta al usuario si quiere eliminar el archivo
			read -p "Eliminar archivo? (Si/No)" rta
				
			if [ $rta = "Si" ]; then
				unset arreglo[i]
				echo "Archivo eliminado del arreglo"
				exit 0
			elif [ $rta = "No" ]; then
				unset arreglo[i]       # elimino archivo del arreglo
				rm -f "${arreglo[i]}"  # elimino archivo del fylesystem
				echo "Archivo eliminado del arreglo y el FyleSystem"
				exit 0
			else 
				echo "Respuesta no válida, no se eliminó el archivo"
				exit 1
			fi
		fi
	done

	if [ $encontre = false ]; then
		echo "Archivo no encontrado"
		exit 10 
	fi

}


verArchivo Ejercicio28.sh
cantidadArchivos
borrarArchivo PRUEB.SH








