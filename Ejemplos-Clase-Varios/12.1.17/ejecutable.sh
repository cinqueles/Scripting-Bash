#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: introducir nombre de un fichero y si es ejecutable, ejecutarlo

read -p "Introduzca el nombre de un fichero: " fich

if [ -x $fich  ]
then
	$fich
else
	echo "Este fichero no es ejecutable"
fi
