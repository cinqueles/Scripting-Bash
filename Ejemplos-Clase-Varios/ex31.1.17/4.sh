#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: mostrar todas las variables del sistema

variable==$(env)
dialog --title "Variables del sistema" --infobox "$variable" 0 0

