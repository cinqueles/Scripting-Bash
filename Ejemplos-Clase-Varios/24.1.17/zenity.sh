#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: seleccion de archivo desde un directorio

FILE=`zenity --file-selection --title="Select a File"`
clear
case $? in
         0)
                echo "\"$FILE\" seleccionado."
		echo $?;;
         1)
                echo "No ha seleccionado ningún archivo."
		echo $?;;
        -1)
                echo "Ha ocurrido un error inesperado."
		echo $?;;
esac
