#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion:Comprobar si tiene conectividad un equipo

read -p "Introduzca IP o dominio: " pin
ping -c1 $pin
echo "______________________________________"
echo $?
