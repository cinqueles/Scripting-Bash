#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: pedir un dia, mes y año y te muestre el calendario.

let dia=0
let mes=0
let year=0

dialog --title "Dia" --inputbox "Entra dia" 0 0 2> /tmp/aux.txt
dia=$(cat /tmp/aux.txt)
dialog --title "Mes" --inputbox "Entra mes" 0 0 2> /tmp/aux.txt
mes=$(cat /tmp/aux.txt)
dialog --title "Year" --inputbox "Entra year" 0 0 2> /tmp/aux.txt
year=$(cat /tmp/aux.txt)

dialog --title "Calendario" --stdout --calendar "Elige una fecha" 0 0 $dia $mes $year

