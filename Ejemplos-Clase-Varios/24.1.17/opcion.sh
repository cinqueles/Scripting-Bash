#!/bin/bash
# Autor: Ismael Morilla
# Version: 1-0
# Descripcion: menu donde escoger opciones

zenity --list \
--title="Elija una opcion" \
--column="fruta" --column="precio" \
--column="proveedor" \
manzana 20 "G" \
pera 10 "E" \
limon 20 "E"
