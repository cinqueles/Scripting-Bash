#!/bin/bash
#Autor: Ismael Morilla
# Version: 1.0
# Descripcion:Debe copiar el archivo "COPYING" en la misma carpeta que este script.
FILE=`dirname $0`/COPYING
zenity --text-info \
--title="Licencia" \
--filename=$FILE \
--checkbox="He leído y acepto los términos."
case $? in
0)
echo "Comenzar instalación"
# siguiente paso
;;
1)
echo "Detener instalación"
;;
-1)
echo "Ha ocurrido un error inesperado."
;;
esac
