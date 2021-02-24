#!/bin/bash
#Autor: Ismael Morilla
# Version: 1.0
# Descripcion: elegir color desde una paleta

color=$(zenity --color-selection --show-palette)

case $? in 
	0) echo "Has seleccionado $color";;
	1) echo "No has seleccionado nada";;
	-1) echo "Error inesperado";;
esac
