#!/bin/bash
f1="dialog --menu Equipos 0 0 0"
var=""
let i=1
exec<partidos.txt
read linea
while [ "$linea" ]
do
	var="$var $linea $i"
	read linea
	let i=$i+1
done
m="$f1 $var"
$m 2>/tmp/eleccion.txt
elegido=$(cat /tmp/eleccion.txt)
echo "Has elegido $elegido"
exec<&-
