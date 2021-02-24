#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: menú con los PID y nombre de los procesos ejecutados en el
# sistema y matar por el PID el elegido

PID=$(ps -A | cut -b1-5)
nombre=$(ps -A | cut -b25-60)
echo "$PID" > /tmp/pid.txt
echo "$nombre" > /tmp/nombre.txt

paste /tmp/pid.txt /tmp/nombre.txt > /tmp/procesos.txt

fija="dialog --menu Procesos 30 50 20"
var=""

exec</tmp/procesos.txt
read linea
while [ "$linea"]
  do
    var="$var $linea"
    read linea
  done
m="$fija $var"
$m 2>/tmp/elegido.txt
elegido=$(cat /tmp/elegido.txt)

if [ -z "$elegido" ]
then
  clear
  echo "adios"
else
  kill -9 $elegido
fi

exec<&-
