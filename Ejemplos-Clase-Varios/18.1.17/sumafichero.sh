#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: creacion de un tercer archivo a partir de la suma de dos 
# ficheros

read -p "Introduce el fichero 1: " fich
read -p "Introduce el fichero 2: " fich2
read -p "Introduce el nombre del fichero 3: " fich3

exec 7<$fich
exec 8<$fich2

read -u 7 linea
while [ "$linea" ]
do
	echo "$linea" >> $fich3
	read -u 7 linea
done

read -u 8 linea
while [ "$linea" ]
do
	echo "$linea" >> $fich3
	read -u 8 linea
done

exec 7<&-
exec 8<&-

echo "------------------------------------"
echo "  RESULTADO DE LA SUMA DE FICHEROS  "
echo "------------------------------------"

cat $fich3
