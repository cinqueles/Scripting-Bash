#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: pedir el nombre de un fichero por un inputbox y mostrar su contenido con un infobox

dialog --title "Introduce" --inputbox "Introduce el nombre del fichero: " 0 0 2> /tmp/aux.txt
fichero=$(cat /tmp/aux.txt)

dialog --title "Contenido $fichero" --textbox $fichero 0 0
