#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: Comprobar la fecha de hoy y ver si coincide con alguna fecha
# del archivo cumples.txt que diga 'Feliz Cumpleaño $nombre'

fecha=$(dialog --stdout --calendar "Elige una fecha" 0 0)
echo $fecha > /tmp/aux.txt
a=$(cat /tmp/aux.txt | cut -f1,2 -d'/')
cat cumples.txt | grep -w ^$a | cut -f2 -d: > /tmp/personas.txt

dialog --title "Cumpleaños" --textbox /tmp/personas.txt 5 30

sleep 2
clear
