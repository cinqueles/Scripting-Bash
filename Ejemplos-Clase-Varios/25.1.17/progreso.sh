#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: barra grafica donde escoger rango

num=$(zenity --scale --text="Elige un numero" --value=100)
case $? in
	0) echo "Ha seleccionado $num";;
	1) echo "No se ha seleccionado ningún número";;
	-1) echo "A ocurrido un error inesperado";;
esac
