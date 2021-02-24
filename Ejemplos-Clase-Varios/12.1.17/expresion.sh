#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: saber si una cadena cumple la expresion regular

read -p "Introduce una cadena: " cad

if [[ "$cad" =~ [a-z][0-9] ]]
then
	echo "Esta cadena contiene numero y letra"
else
	echo "Esta cadena no contiene ni número ni letra"
fi

