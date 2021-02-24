#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0 
# Descripción: decir si una cadena es mayor que otra

read -p "Introduce una cadena: " cad1
read -p "Introduce otra cadena: " cad2

if [ "$cad1" > "$cad2" ]
then
	echo "La cadena '$cad1' es mayor que '$cad2'"
else
	echo "La cadena '$cad1' es menor que '$cad2'"
fi
