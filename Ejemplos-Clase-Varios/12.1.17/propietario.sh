#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripción: comprobar el propietario de un fichero

read -p "Introduzca el nombre de un fichero: " fich

if [ -O $fich ] #Comprueba el propietario del nombre del fichero introducido
then
	xcalc
else
	gedit
fi
