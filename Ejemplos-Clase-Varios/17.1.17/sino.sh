#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: utilizar el dialog yesno para ejecutar un programa u otro 
# dependiendo de la eleccion

dialog --title "Elige opcion" --yesno "Gedit(Si) XCalc(No) " 0 0

case $? in
0) gedit&;;
1) xcalc&;;
esac


