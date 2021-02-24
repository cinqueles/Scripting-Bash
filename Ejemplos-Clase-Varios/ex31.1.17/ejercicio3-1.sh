#!/bin/bash
#Autor: Ismael Morilla
#Descrippcion: hace ping para comprobar conexion

ip=$(zenity --list --title "lista ip" --text "selecciona ip" \
--radiolist --column="seleccion" --column="ip"\
FALSE "192.168.1.1" FALSE "192.168.1.23"\
FALSE "192.168.1.10" FALSE "127.0.0.1");
PING -C2 -W100 $ip
if [ $?=0 ]
then
	zenity --info --text "La ip esta activa"
else
	zenity --info --text "La ip no esta activa"
fi

