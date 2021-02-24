#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: Introducir texto desde gráfico

texto=$(zenity --entry --title="entra texto" --text="Introduce usuario" --entry-text=" ")

echo "Has introducido $texto";
