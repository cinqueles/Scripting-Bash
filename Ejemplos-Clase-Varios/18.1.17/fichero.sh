#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: pedir el nombre de un fichero con las lineas enumeradas

read -p "Introduce el nombre de un fichero: " nom
let nlin=1 #para numerar las lineas
exec < $nom #nombre del fichero a tratar
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
