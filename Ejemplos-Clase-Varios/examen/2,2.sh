#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: ver si un usuario esta registrado

dialog --title "Usuario" --inputbox "Introduce el nombre de usuario" 0 0 2> /tmp/aux.txt
usuario=$(cat /tmp/aux.txt)
datos=$(cat /etc/passwd | grep -w "^$usuario")

if [ "$datos" ]
then
	texto="Info de $usuario":"$datos"
	dialog --title "Usuario registrado" --msgbox "$texto" 0 0
else
	texto="No existe el usuario $usuario"
	dialog --msgbox "$texto" 0 0
fi
