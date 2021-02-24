#!/bin/bash
# Autor:Ismael Morilla
# Version: 1.0
# Descripcion:menu con tres opciones 

dialog --menu "Equipo" 0 0 0 1 "Sevilla" 2 "Betis" 3 "Cadiz" 2> /tmp/aux.txt
equipo=$(cat /tmp/aux.txt)
dialog --infobox "Equipo $equipo" 0 0
