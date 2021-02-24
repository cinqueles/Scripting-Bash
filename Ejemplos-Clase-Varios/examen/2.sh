#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: ver si un usuario esta registrado

dialog --title "Usuario" --inputbox "Introduce el nombre de usuario" 0 0 2> /tmp/aux.txt
usuario=$(cat /tmp/aux.txt)

cat /etc/passwd | grep -w "^$usuario" > /tmp/usuario.txt
dialog --title "Usuario registrado" --textbox /tmp/usuario.txt 0 0
