#!/bin/bash
# Autor: Ismael Morilla
# Version: 1.0
# Descripcion: ejecutar programas dependiendo de las opciones

echo "---------------------"
echo "       Menu          "
echo "---------------------"
echo "| 1. Calculadora    |"
echo "| 2. Gedit          |"
echo "| 3. Firefox        |"
echo "_____________________"
echo ""
read -p "Introduce una opción: " op

case $op in
1) xcalc;;
2) gedit;;
3)read -p "Introduce una URL: " ruta
  url="http://$ruta"
  firefox $url
;;
*)echo "opcion invalida";;
esac
