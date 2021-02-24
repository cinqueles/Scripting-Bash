#!/bin/bash
zenity --forms --title="Registrate" \
	--text="Datos basicos" \
	--separator="," \
	--add-entry="Nombre" \
	--add-entry="Apellidos" \
	--add-entry="Correo-e" \
	--add-calendar="cumpleaños" >> dirs.txt

case $? in
	0) echo "Registrado";;
	1) echo "No se ha registrado";;
	-1) echo "Error inseperado";;
esac
