#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripción: comprobar si es un fichero ordinario o no

read -p "Introduzca el nombre de un fichero: " fich
if [ -f $fich ]
then
	echo "--------------------------------------------"
	echo "El fichero $fich es un archivo ordinario"
	echo "--------------------------------------------"
	cat $fich
else 
	echo "El fichero $fich no es un archivo ordinario"
fi
