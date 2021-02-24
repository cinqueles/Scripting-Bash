#!/bin/bash
ps -A|cut -b25-100>/tmp/procesos.txt
let np=0
#np=$(cat /tmp/procesos.txt | wc -l)
f1="dialog --checklist Elige_proceso 0 0 0"
let i=1
var=""
exec</tmp/procesos.txt
	read linea
	while [ "$linea" ]
	do
		var="$var $linea $i off "
		read linea
		let i=$i+1
	done
m="$f1 $var"
$m 2>/tmp/eleccion.txt
elegidos=$(cat /tmp/eleccion.txt)
killall $elegidos
exec<&-
