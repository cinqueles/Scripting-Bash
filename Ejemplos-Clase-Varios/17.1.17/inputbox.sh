#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: introducir un nombre de un programa en una caja de texto 
# y ejecutarlo

dialog --title "Ejecutar" --inputbox "Introduce un nombre de programa:" 0 0 2> /tmp/resultado.txt
programa=$(cat /tmp/resultado.txt)

$programa&


