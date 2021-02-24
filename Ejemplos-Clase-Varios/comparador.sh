#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.2
# Descripcion:comparador de numero


#read -p "Introduzca un numero: " num

let resultado=$RANDOM%2
if [ $resultado -eq 0 ]
	then
		echo "El número $RANDOM es par"
		gedit&
	else
		echo "El número $RANDOM es impar"
		xcalc&
fi
