#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: contraseña grafica

entry=$(zenity --password)
case $? in

0) echo "Contraseña: $(echo $entry)";;
1) echo "No iniciar sesion";;
esac
