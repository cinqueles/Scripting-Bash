#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: saber si la IP tiene conectividad

opcion=$(dialog --menu "Elige una IP" 0 0 0 \
 "192.168.1.24" 1\
 "192.168.1.21" 2 \
 "192.168.1.27" 3 \
 "192.168.1.7" 4 3<&1 1<&2 2<&3)

echo "has elegido $opcion"

ping=$(ping -c 1 $opcion)
if [ $? -eq 0 ]
then
	dialog --title "conectividad" --infobox "Hay conectividad" 0 0 
else
	dialog --title "conectividad" --infobox "No hay conectividad" 0 0
fi
