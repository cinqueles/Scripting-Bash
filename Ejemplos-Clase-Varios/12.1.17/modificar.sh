#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripción: saber si un fichero ha sido modificada desde la última lectura

read -p "Introduzca el nombre de un fichero: " fich

if [ -N $fich ]
then
	echo "Este fichero ha sido modificado despues de su última lectura"
else
	echo "Este fichero no ha sido modificado despues de su última lecutra"
fi
