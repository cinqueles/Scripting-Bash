#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: creacion de un tercer archivo a partir de la suma de dos 
# ficheros

dialog --title "Fichero origen 1" --inputbox "Introduce nombre fichero" 0 0 2> /tmp/aux.txt
fich1=$(cat /tmp/aux.txt)
dialog --title "Fichero 1" --textbox "$fich1" 0 0
dialog --title "Fichero orgien 2" --inputbox "Introduce nombre fichero" 0 0 2> /tmp/aux.txt
fich2=$(cat /tmp/aux.txt)
dialog --title "Fichero 2" --textbox "$fich2" 0 0
dialog --title "Fichero destino" --inputbox "Introduce nombre fichero destino" 0 0 2> /tmp/aux.txt
fich3=$(cat /tmp/aux.txt)

exec 3<$fich1
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

resultado=$(cat $fich3)
dialog --title "RESULTADO DE LA SUMA DE LOS FICHEROS" --infobox "$resultado" 0 0
