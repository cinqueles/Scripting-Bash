#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: mostrar calendario

zenity --calendar \
	--title="Seleccione una fecha" \
	--text="Pulse una fecha para seleccionar" \
	--day=11 --month=2 --year=2017
