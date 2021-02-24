#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: creacion de un tercer archivo a partir de la suma de dos 
# ficheros

read -p "Introduce el fichero 1: " fich
read -p "Introduce el fichero 2: " fich2
read -p "Introduce el nombre del fichero 3: " fich3

exec 3<$fich
exec 4<$fich2

read -u 3 linea1
read -u 4 linea2

while [ "$linea1" -o "$liena2" ]
do
	if [ "$linea1" ]
	   then
		echo "$linea1" >> $fich3
	fi

	if [ "$linea2" ]
	   then
		echo "$linea2" >> $fich3
	fi
	read -u 3 linea1
	read -u 4 linea2
done

exec 3<&-
exec 4<&-

echo "------------------------------------"
echo "  RESULTADO DE LA SUMA DE FICHEROS  "
echo "------------------------------------"

cat $fich3
