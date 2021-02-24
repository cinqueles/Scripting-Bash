#!/bin/bash
#Autor: Ismael Morilla
#Version: 1.1
#Descripcion: menu dinamicos

fija1="dialog --menu \"Equipo\" 0 0 0 "  # \" metacaracter para que no interprete l
  				      # las comillas 
fija2="2>/tmp/eleccion.txt"
variable=""

let i=0
exec<partidos.txt
read linea
while [ "$linea" ]
do
	variable="$variable $i \"$linea\" "
	read linea
	let i=$i+1
done
exec<&-

menu="$fija1 $variable $fija2"
echo $menu>/tmp/menu.sh
chmod +x /tmp/menu.sh
/tmp/menu.sh
