#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: dos cajas de texto para añadir dos sumandos y que muestre el resultado de la suma

dialog --title "Introduce" --inputbox "Introduce un numero:" 0 0 2> /tmp/aux.txt
let sum=$(cat /tmp/aux.txt)
dialog --title "Introduce" --inputbox "Introduce otro numero:" 0 0 2> /tmp/aux.txt
let sum2=$(cat /tmp/aux.txt)

let suma=$sum+$sum2


cadena="El resultado de la suma de $sum + $sum2 es $suma"
dialog --infobox "$cadena" 5 30
