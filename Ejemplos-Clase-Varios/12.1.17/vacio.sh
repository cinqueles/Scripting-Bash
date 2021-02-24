#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: saber si una cadena está vacia o no

read -p "Introduce una cadena: " cad

if [ -z "$cad" ]
then
	echo "Esta cadena está vacía"
else
	echo "Esta caenda '$cad' no está vacía"
fi
