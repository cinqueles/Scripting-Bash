#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: Comparar dos cadenas y ver si son iguales

read -p "Introduce una cadena: " cad1
read -p "Introduce otra cadena: " cad2

if [ "$cad1" == "$cad2" ]
then
	echo "La cadena '$cad1'es igual que '$cad2'"
else
	echo "La cadena '$cad1' no es igual que '$cad2'"
fi

