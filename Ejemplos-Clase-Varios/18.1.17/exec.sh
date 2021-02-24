#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: mostrar un fichero con las lineas enumeradas

let nlin=1 #para numerar las lineas
exec < /etc/passwd
read linea
while [ "$linea" ]
do
	echo "$nlin $linea"
	let nlin=$nlin+1
	read linea 
	#Cada vez que se pone 'read linea' va leyendo automaticamente la 
	#linea siguiente y si no es final de fichero sigue leyendo.
done
exec<&-
