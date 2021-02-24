#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion:menu con todos los sevicios instalados en el sistema que
# tengan un reflejo en /etc/init.d, se elige el servicio
# y en un radiolist se pondrá start, stop,restart y reload.

ls -l /etc/init.d|grep ^-|cut -b42-100>/tmp/servicios.txt

f1="dialog --menu Servicios 0 0 0 "
var=""
let i=1
exec</tmp/servicios.txt
read linea
while [ "$linea" ]
do
        var="$var $linea $i "
        let i=$i+1
        read linea
done

m="$f1 $var"
$m 2>/tmp/elegido.txt
servicio=$(cat /tmp/elegido.txt)
dialog --radiolist Eleccion 0 0 0 \
start 1 off \
stop 2 off \
restart 3 off \
reload 4 off 2>/tmp/estado.txt
estado=$(cat /tmp/estado.txt)
/etc/init.d/$servicio $estado
exec<&-

