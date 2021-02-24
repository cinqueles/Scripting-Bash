#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: menu con el nombre de los procesos ejecutados en el menu

ps -A | cut -b25-100 | tee /tmp/proceso.txt
f1="dialog --menu Procesos 0 0 0 "
var=""
let i=1
exec</tmp/proceso.txt
read linea
read linea
while [ "$linea" ]
do
	var="$var $linea $i"
	read linea
	let i=$i+1
done

m="$f1 $var"
$m 2>/tmp/matar.txt
matar=$(cat /tmp/matar.txt)
echo "has elegido $matar"
exec<&-
killall $matar
