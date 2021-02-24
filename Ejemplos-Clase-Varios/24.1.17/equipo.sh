#!/bin/bash
#Autor: Ismael Morilla
#Version: 1.1
#Descripcion: menu variables

#dialog --menu "Equipo" 0 0 0 Sevilla "1" Betis "2" RM "3" 2> /tmp/aux.txt

#equipo=$(cat /tmp/aux.txt)
#echo "$equipo"

fija1="dialog --menu \"Equipo\" 0 0"  # \" metacaracter para que no interprete l
  				      # las comillas 
fija2="2>/tmp/eleccion.txt"
variable=""

let i=0
exec<partidos.txt
read linea
while [ "$linea" ]
do
	variable="$variable $i $linea"
	read linea
done
exec<&-

menu=$fija1 $variable $fija2
$menu
