#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: decir que fichero es más antiguo que otro

read -p "Introduce el nombre de un fichero: " fich
read -p "Introduce el nombre de otro fichero: " fich2

if [ "$fich" -ot "$fich2" ]
then
	echo "El fichero '$fich' es más antiguo que '$fich2'"
else
	echo "El fichero '$fich2' es más antiguo que '$fich'"
fi
