#!/bin/bash
dialog --title "usuario" --inputbox "entra nuevo usuario" 0 0 2>/tmp/usuario.txt
usuario=$(cat /tmp/usuario.txt)
esta=$(cat /etc/passwd|grep -w ^$usuario)
if [ "$esta" ]
then
	dialog --title "Usuario" --msgbox "$usuario ya esta registrado" 0 0
else
	adduser $usuario
fi
