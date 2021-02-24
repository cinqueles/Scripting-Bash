#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripción: comprobar si un archivo es de bloque o de caracter

read -p "Introduzca el nombre de un archivo: " fich

if [ -b $fich ]
then
	echo "Este fichero de acceso a dispositivo es de bloque"
else
	if [ -c $fich ]
	then
		echo "Este fichero de acceso a dispositivo es de caracter"
	else
		echo "Este fichero no es de acceso a dispositivo"
	fi
fi
